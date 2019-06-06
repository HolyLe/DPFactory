//
//  DPCoreTextSizeTool.m
//  DPFactory
//
//  Created by 麻小亮 on 2019/6/6.
//  Copyright © 2019 麻小亮. All rights reserved.
//

#import "DPCoreTextSizeTool.h"
#import <CoreText/CoreText.h>
@interface DPCoreTextSizeTool()
@property (nonatomic, strong) NSMutableDictionary *textAttributes;
@property (nonatomic, strong) NSAttributedString * attributedString;
@end
@implementation DPCoreTextSizeTool

- (void)reload{
    self.textAttributes[NSFontAttributeName] = _font;
    if (_text.length == 0){
        _maxHeight = 0;
        _minHeight = 0;
        return;
    }
    
    _attributedString = [[NSAttributedString alloc] initWithString:_text attributes:_textAttributes];
    CGSize size = CGSizeMake(_width - _contentInset.left - _contentInset.right, CGFLOAT_MAX);
    _maxHeight = [self getSize:size numberOflines:0];
    _minHeight = [self getSize:size numberOflines:_numberOflines];
}

- (CGFloat)getSize:(CGSize)size numberOflines:(NSInteger)numerOfLines{
    
    
    CFAttributedStringRef attributedStringRef = (__bridge CFAttributedStringRef)_attributedString;
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString(attributedStringRef);
    CFRange range = CFRangeMake(0, 0);
    if (numerOfLines > 0 && framesetter) {
        CGMutablePathRef path = CGPathCreateMutable();
        CGPathAddRect(path, NULL, CGRectMake(0, 0, size.width, size.height));
        CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, 0), path, NULL);
        CFArrayRef lines = CTFrameGetLines(frame);
        
        if (nil != lines && CFArrayGetCount(lines) > 0) {
            NSInteger lastVisibleLineIndex = MIN(numerOfLines, CFArrayGetCount(lines)) - 1;
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
        newSize.height += _contentInset.top + _contentInset.bottom;
    }
    if (framesetter) {
        CFRelease(framesetter);
    }
    return newSize.height;
}
@end
