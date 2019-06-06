//
//  DPWeakProxy.h
//  DiamondPark
//
//  Created by 麻小亮 on 2019/4/9.
//  Copyright © 2019 DiamondPark. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DPWeakProxy : NSProxy
@property (nonatomic, nullable, weak, readonly) id  target;
- (instancetype)initWithTarget:(id)target;
+ (instancetype)proxyWithTarget:(id)target;
@end

NS_ASSUME_NONNULL_END
