//
//  DPTimer.h
//  DiamondPark
//
//  Created by 麻小亮 on 2019/5/27.
//  Copyright © 2019 DiamondPark. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, DPTimerType) {
    DPTimerType_Default,//NSTimer定时器
    DPTimerType_GCD,//gcd定时器
    DPTimerType_Display,//CADisplayLink
    DPTimerType_Mach//
};

@interface DPTimer : NSObject
/**
 自动开始
 */
+ (DPTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^) (DPTimer *timer))block;

/**
 需要手动开始
 */
+ (DPTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^) (DPTimer *timer))block;

- (void)stop;

- (void)start;

@end

NS_ASSUME_NONNULL_END
