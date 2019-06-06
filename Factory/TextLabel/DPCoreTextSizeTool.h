//
//  DPCoreTextSizeTool.h
//  DPFactory
//
//  Created by 麻小亮 on 2019/6/6.
//  Copyright © 2019 麻小亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface DPCoreTextSizeTool : NSObject

@property (nonatomic, copy) NSString * text;

@property (nonatomic, strong) UIFont * font;

@property (nonatomic, assign) NSInteger  numberOflines;

@property (nonatomic, assign) UIEdgeInsets  contentInset;

@property (nonatomic, assign) CGFloat  width;

@property (nonatomic, assign) CGFloat lineSpacing;

@property (nonatomic, assign) CGFloat paragraphSpacing;

@property (nonatomic, assign, readonly) CGFloat  maxHeight;

@property (nonatomic, assign, readonly) CGFloat  minHeight;

- (void)reload;


@end

NS_ASSUME_NONNULL_END
