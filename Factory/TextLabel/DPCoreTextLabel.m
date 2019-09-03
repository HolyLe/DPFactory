//
//  DPLabel.m
//  WisdomTree-Teacher
//
//  Created by 麻小亮 on 2019/2/26.
//  Copyright © 2019 able44. All rights reserved.
//

#import "DPCoreTextLabel.h"
#import <CoreText/CoreText.h>

#define DPCoreTextDefaultHeight 1
#define DPCoreTextDefaultWidth 1
@interface DPCoreTextLabel (){
    UIFont *_defaultTextFont;
    UIColor *_defaultTextColor;
    UIFont *_defaultTruncationFont;
    UIColor *_defaultTruncationColor;
    CGFloat _lastWidth;
}
@property (nonatomic, strong) NSMutableAttributedString * attributedString;
@property (nonatomic, strong) NSMutableAttributedString * truncationAttributedString;
@property (nonatomic, strong) NSMutableDictionary *textAttributes;
@property (nonatomic, strong) NSMutableDictionary *truncationAttributes;
@property (nonatomic, assign) CGSize  theSize;
@property (nonatomic, strong) NSMutableArray * heightArray;
@property (nonatomic, assign) CGRect  trunctionClickRect;
@property (nonatomic, assign) BOOL  isReadyLayout;
@end

@implementation DPCoreTextLabel
static CGFloat getAscent(void *ref) {
    float height = [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"height"] floatValue];
    return height;
}

static CGFloat getDescent(void *ref) {
    return 0;
}

static CGFloat getWidth(void *ref) {
    float width = [(NSNumber *)[(__bridge NSDictionary *)ref objectForKey:@"width"] floatValue];
    return width;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        self.backgroundColor = [UIColor whiteColor];
        _defaultTextFont = [UIFont systemFontOfSize:14];
        _defaultTextColor = [UIColor blackColor];
        _defaultTruncationFont = [UIFont systemFontOfSize:14];
        _defaultTruncationColor = [UIColor blueColor];
        CGFloat lineSpacing = 0;
        _theSize = CGSizeMake(frame.size.width > 0?:DPCoreTextDefaultWidth, frame.size.height > 0?:DPCoreTextDefaultHeight);
        const CFIndex kNumberOfSettings = 3;
        CTParagraphStyleSetting theSettings[kNumberOfSettings] = {
            {kCTParagraphStyleSpecifierLineSpacingAdjustment,sizeof(CGFloat),&lineSpacing},
            {kCTParagraphStyleSpecifierMaximumLineSpacing,sizeof(CGFloat),&lineSpacing},
            {kCTParagraphStyleSpecifierMinimumLineSpacing,sizeof(CGFloat),&lineSpacing},
        };
        _lastWidth = -1;
        CTParagraphStyleRef theParagraphRef = CTParagraphStyleCreate(theSettings, kNumberOfSettings);
        _truncationAttributes[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
        _textAttributes[(id)kCTParagraphStyleAttributeName] = (__bridge id)theParagraphRef;
        CFRelease(theParagraphRef);
        [self addDic:self.textAttributes font:_defaultTextFont];
        [self addDic:self.truncationAttributes font:_defaultTruncationFont];
        [self addDic:self.textAttributes color:_defaultTextColor];
        [self addDic:self.truncationAttributes color:_defaultTruncationColor];
    }
    return self;
}

- (void)addDic:(NSMutableDictionary *)dic font:(UIFont *)font{
    CTFontRef fontRef =  (__bridge CTFontRef)font;
    dic[(id)kCTFontAttributeName] = (__bridge id) fontRef;
}
- (void)addDic:(NSMutableDictionary *)dic color:(UIColor *)color{
    dic[(id)kCTForegroundColorAttributeName] = (id)color.CGColor;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    if (_lastWidth != self.frame.size.width) {
        _lastWidth = self.frame.size.width;
        [self reloadDisplay];
        if (_isReadyLayout) {
            [self setNeedsDisplay];
        }
        if (self.heightChange) {
            self.heightChange(ceil(self.frame.size.height),self);
        }
        if ([self.delegate respondsToSelector:@selector(coreTextLabel:titleHeightChanged:)]) {
            [self.delegate coreTextLabel:self titleHeightChanged:self.frame.size.height];
        }
    }
    
}

- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    _isReadyLayout = NO;
    [self.heightArray removeAllObjects];
    CGFloat width = rect.size.width - _contentInset.left - _contentInset.right;
    CGFloat height = rect.size.height - _contentInset.bottom - _contentInset.top;
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetTextMatrix(context, CGAffineTransformIdentity);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1, -1);
    NSMutableAttributedString *attributedString = self.attributedString;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL,CGRectMake(_contentInset.left, _contentInset.bottom, width,height));
    CTFramesetterRef setter = CTFramesetterCreateWithAttributedString((__bridge CFMutableAttributedStringRef)attributedString);
    
    NSInteger length = attributedString.length;
    CTFrameRef frame = CTFramesetterCreateFrame(setter, CFRangeMake(0, length), path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(frame);
    CFIndex  linesCount = CFArrayGetCount(lines);
    CFIndex numberOfline = _numberOflines <= 0?_numberOflines : MIN(_numberOflines, linesCount);
    
    if (numberOfline <= 0) {
        CTFrameDraw(frame, context);
        CGPoint lineOrigins[linesCount];
        CTFrameGetLineOrigins(frame, CFRangeMake(0, linesCount), lineOrigins);
        _theSize = [self getSize:CGSizeMake(width, CGFLOAT_MAX)];
        for (int i = 0; i < linesCount; i++) {
            CGPoint position = lineOrigins[i];
            CGFloat OY = position.y + _contentInset.bottom;
            [_heightArray addObject:@(rect.size.height - OY)];
        }
    }else{
        CGPoint lineOrigins[numberOfline];
        CTFrameGetLineOrigins(frame, CFRangeMake(0, numberOfline), lineOrigins);
        _theSize = [self getSize:CGSizeMake(width, CGFLOAT_MAX)];
        for (CFIndex i = 0; i < numberOfline; i++) {
            CTLineRef line = CFArrayGetValueAtIndex(lines, i);
            CFRange range = CTLineGetStringRange(line);
            CGPoint position = lineOrigins[i];
            CGFloat OY = position.y + _contentInset.bottom;
            CGFloat OX = position.x + _contentInset.left;
            if (i == numberOfline - 1 && range.location + range.length < length) {
                NSAttributedString *truncationString = nil;
                [_heightArray addObject:@(rect.size.height - OY)];
                truncationString = [[NSMutableAttributedString alloc] initWithString:@"\u2026" attributes:_textAttributes];
                NSMutableAttributedString *moreString = truncationString.mutableCopy;
                if (_truncationAttributedString) {
                    [moreString appendAttributedString:_truncationAttributedString];
                }
                CTLineRef moreLine = CTLineCreateWithAttributedString((CFAttributedStringRef)moreString);
                CGFloat tokenWidth;
                CTLineGetOffsetForStringIndex(moreLine, moreString.length, &tokenWidth);
                CFRelease(moreLine);
                CFIndex truncationEndIndex = CTLineGetStringIndexForPosition(line, CGPointMake(width - tokenWidth - 10, 0));
                CTLineRef trucationLine = CTLineCreateWithAttributedString((CFAttributedStringRef)truncationString);
                NSInteger length = range.location + range.length - truncationEndIndex;
                NSMutableAttributedString *final = [[NSMutableAttributedString alloc] initWithAttributedString:[attributedString attributedSubstringFromRange:NSMakeRange(range.location, range.length)]];
                
                if (length <= final.length) {
                    [final deleteCharactersInRange:NSMakeRange(final.length - length, length)];
                    CGFloat offsetXTruncation;
                    CTLineGetOffsetForStringIndex(line, truncationEndIndex, &offsetXTruncation);
                    
                    [final appendAttributedString:truncationString];
                    CGFloat space = width - tokenWidth - offsetXTruncation - position.x;
                    if (space > 0) {
                        CTRunDelegateCallbacks callback;
                        memset(&callback, 0, sizeof(CTRunDelegateCallbacks));
                        callback.getAscent = getAscent;
                        callback.getDescent = getDescent;
                        callback.getWidth = getWidth;
                        NSDictionary *metaData = @{@"width":@(space), @"height":@2};
                        CTRunDelegateRef runDelegate = CTRunDelegateCreate(&callback, (__bridge_retained void *)(metaData));
                        unichar objectReplacementChar = 0xFFFC;
                        NSMutableAttributedString *imagePlaceHolderAttributeString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithCharacters:&objectReplacementChar length:1] attributes:_textAttributes];
                        CFAttributedStringSetAttribute((CFMutableAttributedStringRef)imagePlaceHolderAttributeString, CFRangeMake(0, 1), kCTRunDelegateAttributeName, runDelegate);
                        CFRelease(runDelegate);
                        [final appendAttributedString:(NSMutableAttributedString *)imagePlaceHolderAttributeString];
                    }
                    if (_truncationAttributedString) {
                        [final appendAttributedString:_truncationAttributedString];
                    }
                }
                CTLineRef fineLine = CTLineCreateWithAttributedString((CFAttributedStringRef)final);
                CTLineTruncationType truncationType = kCTLineTruncationEnd;
                CTLineRef lastLine = CTLineCreateTruncatedLine(fineLine, width, truncationType, trucationLine);
                CTRunRef truncationRun =(__bridge CTRunRef)[(__bridge NSArray *)CTLineGetGlyphRuns(lastLine) lastObject];
                CGFloat truncationascent;
                CGFloat truncationdesent;
                CGFloat truncationRunWidth = CTRunGetTypographicBounds(truncationRun, CFRangeMake(0, 0), &truncationascent, &truncationdesent, NULL);
                CGFloat truncationRunHeight = [_textAttributes[NSFontAttributeName] lineHeight];
                CGFloat xOffset = OX + CTLineGetOffsetForStringIndex(lastLine, CTRunGetStringRange(truncationRun).location, NULL);
                CGFloat yOffset = rect.size.height - OY - truncationascent;
                self.trunctionClickRect = CGRectMake(xOffset, yOffset, truncationRunWidth, truncationRunHeight);
                CGContextSetTextPosition(context, OX, OY);
                CTLineDraw(lastLine, context);
                CFRelease(fineLine);
                CFRelease(trucationLine);
            }else{
                CGContextSetTextPosition(context, OX, OY);
                CTLineDraw(line, context);
            }
        }
    }
    CGPathRelease(path);
    CFRelease(frame);
    CFRelease(setter);
}

- (CGFloat)maxHeight{
    return self.heightWithLine(0);
}

- (CGFloat)minHeight{
    return self.heightWithLine(-1);
}

- (CGFloat (^)(NSInteger))heightWithLine{
    return ^(NSInteger line){
        CGFloat height = 0;
        if (line < 0) {
            if (self.heightArray.count == 0) {
                height =  0.f;
            }else{
                height = [[self.heightArray firstObject] floatValue] + self.contentInset.top + self.contentInset.bottom;
            }
        }else if(line == 0){
            height = [[self.heightArray lastObject] floatValue] + self.contentInset.top + self.contentInset.bottom;
        }else{
            CGFloat lineHeight = self.heightArray.count > line? [[self.heightArray objectAtIndex:line] floatValue] : 0;
            height = lineHeight + self.contentInset.top + self.contentInset.bottom;
        }
        return height;
    };
}

/**
 计算内容高度
 */
- (CGSize)sizeThatFits:(CGSize)size{
    return [self getSize:size];
}


- (CGSize)getSize:(CGSize)size{
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)_attributedString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedStringRef);
    CFRange range = CFRangeMake(0, 0);
    if (size.width == 1) {
        size.width = MAXFLOAT;
    }
    if (_numberOflines > 0 && framesetter) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        CFArrayRef lines = CTFrameGetLines(frame);
        
        if (nil != lines && CFArrayGetCount(lines) > 0) {
            NSInteger lastVisibleLineIndex = MIN(_numberOflines, CFArrayGetCount(lines)) - 1;
            CTLineRef lastVisibleLine = CFArrayGetValueAtIndex(lines, lastVisibleLineIndex);
            
            CFRange rangeToLayout = CTLineGetStringRange(lastVisibleLine);
            range = CFRangeMake(0, rangeToLayout.location + rangeToLayout.length);
        }
        CFRelease(frame);
        CFRelease(path);
    }
    CFRange fitCFRange = CFRangeMake(0, 0);
    CGSize newSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, range, NULL, size, &fitCFRange);
    if (newSize.height > 0) {
        newSize.height = ceil(newSize.height+ _contentInset.top + _contentInset.bottom);
    }
    if (newSize.width > 0) {
        newSize.width = ceil(newSize.width + _contentInset.left + _contentInset.right);
    }
    if (framesetter) {
        CFRelease(framesetter);
    }
    return newSize;
}


- (void)setFont:(UIFont *)font{
    if (!font) {
        _font = _defaultTextFont;
    }else{
        _font = font;
    }
    [self addDic:_textAttributes font:_font];
}

- (void)setTextColor:(UIColor *)textColor{
    if (!textColor) {
        _textColor = _defaultTextColor;
    }else{
        _textColor = textColor;
    }
    [self addDic:_textAttributes color:_textColor];
}

- (void)setTruncationTextColor:(UIColor *)truncationTextColor{
    if (!truncationTextColor) {
        _truncationTextColor = _defaultTruncationColor;
    }else{
        _truncationTextColor = truncationTextColor;
    }
    [self addDic:_truncationAttributes color:_truncationTextColor];
}

- (void)setTruncationFont:(UIFont *)truncationFont{
    if (!truncationFont) {
        _truncationFont = _defaultTruncationFont;
    }else{
        _truncationFont = truncationFont;
    }
    [self addDic:_truncationAttributes font:_truncationFont];
}

- (void)reloadDisplay{
    [self.attributedString setAttributes:_textAttributes range:NSMakeRange(0, self.attributedString.length)];
    [self.truncationAttributedString setAttributes:_truncationAttributes range:NSMakeRange(0, self.truncationAttributedString.length)];
    NSInteger length = self.attributedString.length;
    if (![_text isEqualToString:self.attributedString.string]) {
        [self.attributedString deleteCharactersInRange:NSMakeRange(0, length)];
        if (_text.length > 0) {
            [self.attributedString appendAttributedString:[[NSAttributedString alloc]initWithString:_text attributes:_textAttributes]];
        }
        
    }
    NSInteger truncationLength = self.truncationAttributedString.length;
    if (![_truncationString isEqualToString:self.truncationAttributedString.string]) {
        [self.truncationAttributedString deleteCharactersInRange:NSMakeRange(0, truncationLength)];
        if (_truncationString.length > 0) {
            [self.truncationAttributedString appendAttributedString:[[NSAttributedString alloc]initWithString:_truncationString attributes:_truncationAttributes]];
        }
    }
    _isReadyLayout = YES;
    _theSize = [self getSize:CGSizeMake(self.frame.size.width, CGFLOAT_MAX)];
    [self invalidateIntrinsicContentSize];
    [self setNeedsDisplay];
}


- (CGSize)intrinsicContentSize{
    if (_theSize.height == 0) {
        return CGSizeZero;
    }
    return _theSize;
}



- (NSMutableAttributedString *)attributedString{
    if (!_attributedString) {
        _attributedString = [[NSMutableAttributedString alloc] init];
        
    }
    return _attributedString;
}
- (NSMutableAttributedString *)truncationAttributedString{
    if (!_truncationAttributedString) {
        _truncationAttributedString = [NSMutableAttributedString new];
        
    }
    return _truncationAttributedString;
}

- (NSMutableDictionary *)textAttributes{
    if (!_textAttributes) {
        _textAttributes = [NSMutableDictionary new];
    }
    return _textAttributes;
}

- (NSMutableDictionary *)truncationAttributes{
    if (!_truncationAttributes) {
        _truncationAttributes = [NSMutableDictionary new];
    }
    return _truncationAttributes;
}

- (NSMutableArray *)heightArray{
    if (!_heightArray) {
        _heightArray = [NSMutableArray array];
    }
    return _heightArray;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    if (self.truncationClick) {
        UITouch *touch = event.allTouches.anyObject;
        if (touch.view == self) {
            CGPoint point = [touch locationInView:self];
            if (CGRectContainsPoint(self.trunctionClickRect, point)) {
                self.numberOflines = 0;
                self.truncationClick(self);
                [self reloadDisplay];
                self.trunctionClickRect = CGRectMake(- 10, - 10, 0, 0);
            }
        }
        
    }
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */

@end
