//
//  DPCommonNavigationBar.h
//  WisdomTree
//
//  Created by 麻小亮 on 2018/12/20.
//  Copyright © 2018 able-elec. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DPCategory.h"
NS_ASSUME_NONNULL_BEGIN

@protocol DPCommonNavigationBarDelegate <NSObject>

@optional
/**
 左按钮点击事件
 */
- (void)leftButtonTap:(UIButton *)button;

/**
 中间按钮点击事件
 */
- (void)middleButtonTap:(UIButton *)button;

/**
 右按钮点击事件
 */
- (void)rightButtonTap:(UIButton *)button;

/**
 导航栏点击事件
 */
- (void)navigationClick:(UIView *)view;

/**
 导航点击事件是否可以向下传递
 */
- (BOOL)navigationEventsShouldPass;

/**
 设置button的类，如果为UIButton传@[@"",@"",@""]，或不传
 */
- (NSArray *)buttonClasses;

@end

@class DPCommonNavigationBar;

typedef void(^nav_Block)(DPCommonNavigationBar *bar);

@interface DPCommonNavigationBar : UIView

@property (nonatomic, weak) id <DPCommonNavigationBarDelegate> delegate;

@property (nonatomic, strong, readonly) UIView * leftView;

@property (nonatomic, strong, readonly) UIView * rightView;

@property (nonatomic, strong) UIButton * leftButton;

@property (nonatomic, strong) UIButton * rightButton;

@property (nonatomic, strong) UIButton * middleButton;

@property (nonatomic, strong) UIView * line;

@property (nonatomic, assign, readonly) NSInteger  currentTag;

- (void)setupTag:(NSInteger)tag WithBlock:(nav_Block)block;

- (void)setTag:(NSInteger)tag;

@end

NS_ASSUME_NONNULL_END
