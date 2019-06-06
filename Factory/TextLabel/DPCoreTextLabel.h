//
//  DPLabel.h
//  WisdomTree-Teacher
//
//  Created by 麻小亮 on 2019/2/26.
//  Copyright © 2019 able44. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPCategory.h"

NS_ASSUME_NONNULL_BEGIN
@class DPCoreTextLabel;
@protocol DPCoreTextLabelDelegate <NSObject>
@optional
- (void)coreTextLabel:(DPCoreTextLabel *)label titleHeightChanged:(CGFloat)height;
@end

@interface DPCoreTextLabel : UIView

@property (nonatomic, weak) id <DPCoreTextLabelDelegate> delegate;

@property (nonatomic, copy) NSString * text;

@property (nonatomic, strong) UIFont * font;

@property (nonatomic, strong) UIColor * textColor;

@property (nonatomic, assign) NSInteger  numberOflines;

@property (nonatomic, strong) NSString * truncationString;

@property (nonatomic, strong) UIFont * truncationFont;

@property (nonatomic, strong) UIColor * truncationTextColor;

@property (nonatomic, assign) UIEdgeInsets  contentInset;

@property (nonatomic, copy) void (^ heightChange) (CGFloat height, DPCoreTextLabel *label);

@property (nonatomic, copy, readonly) CGFloat (^heightWithLine) (NSInteger line);

@property (nonatomic, assign, readonly) CGFloat  maxHeight;

@property (nonatomic, assign, readonly) CGFloat  minHeight;

@property (nonatomic, assign) CTLineBreakMode lineBreakMode;

@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) CGFloat paragraphSpacing;

@property (nonatomic, assign) CTTextAlignment textAlignment;

@property (nonatomic, copy) void (^ truncationClick) (DPCoreTextLabel *textLabel);

- (void)reloadDisplay;

- (void)reloadNewDisplay;

@end

NS_ASSUME_NONNULL_END
