//
//  DPTimer.m
//  DiamondPark
//
//  Created by 麻小亮 on 2019/5/27.
//  Copyright © 2019 DiamondPark. All rights reserved.
//

#import "DPTimer.h"
#import <mach/mach.h>
#import <mach/mach_time.h>
typedef NS_ENUM(NSUInteger, DPTimerStatus) {
    DPTimerStatusUnStart,
    DPTimerStatusStarting,
};
@interface DPTimer ()
{
    dispatch_queue_t _queue;
    dispatch_source_t _timer;
    
    DPTimerStatus _status;
    void (^_block) (DPTimer *);
    BOOL _isRepeats;
    NSTimeInterval _timeSpace;
    NSDate * _stopDate;
}

@end

@implementation DPTimer



+ (DPTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(DPTimer * _Nonnull))block{
    DPTimer *timer = [DPTimer new];
    [timer timerSpace:seconds repeats:repeats block:block];
    [timer start];
    return timer;
}

+ (DPTimer *)timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats block:(void (^)(DPTimer * _Nonnull))block{
    DPTimer *timer = [DPTimer new];
    [timer timerSpace:seconds repeats:repeats block:block];
    return timer;
}

- (void)timerSpace:(NSTimeInterval)time repeats:(BOOL)repeates block:(void (^) (DPTimer *))block{
    _timeSpace = time;
    _isRepeats = repeates;
    _block = block;
}

- (void)stop{
    if (_status == DPTimerStatusUnStart) return;
    _status = DPTimerStatusUnStart;
    dispatch_source_cancel(_timer);
    _queue = nil;
    _block = nil;
}

- (void)start{
    if (_status == DPTimerStatusStarting) return;
    _status = DPTimerStatusStarting;
    _queue = dispatch_get_global_queue(0, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, _queue);
    __weak typeof(self)weakSelf = self;
    
    dispatch_source_set_timer(_timer, dispatch_time(DISPATCH_TIME_NOW, 1), _timeSpace * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    dispatch_source_set_event_handler(_timer, ^{
        __strong typeof(weakSelf)self = weakSelf;
        if (self->_block) {
            self->_block(self);
        }
        if (!self->_isRepeats){
            [self stop];
        }
    });
    dispatch_resume(_timer);
}

- (void)dealloc
{
    [self stop];
}

@end
