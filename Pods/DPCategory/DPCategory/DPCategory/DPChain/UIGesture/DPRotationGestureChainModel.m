//
//  DPRotationGestureChainModel.m
//  DPCategory
//
//  Created by 麻小亮 on 2018/12/31.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "DPRotationGestureChainModel.h"
#define DPCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(DPMethod,DPParaType) DPCATEGORY_CHAIN_GESTURECLASS_IMPLEMENTATION(DPMethod,DPParaType, DPRotationGestureChainModel *, UIRotationGestureRecognizer)
@implementation DPRotationGestureChainModel
DPCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION(rotation, CGFloat)
@end
DPCATEGORY_GESTURE_IMPLEMENTATION(UIRotationGestureRecognizer, DPRotationGestureChainModel)
#undef DPCATEGORY_CHAIN_ROTAGESTURE_IMPLEMENTATION
