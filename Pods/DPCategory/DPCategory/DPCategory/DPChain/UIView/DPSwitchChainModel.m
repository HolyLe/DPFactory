//
//  DPSwitchChainModel.m
//  DPCategory
//
//  Created by 麻小亮 on 2018/12/27.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import "DPSwitchChainModel.h"
#define DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(DPMethod,DPParaType) DPCATEGORY_CHAIN_VIEWCLASS_IMPLEMENTATION(DPMethod,DPParaType, DPSwitchChainModel *,UISwitch)
@implementation DPSwitchChainModel

DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(on, BOOL);
DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onTintColor, UIColor *);
DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(thumbTintColor, UIColor *);

DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(onImage, UIImage *);
DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION(offImage, UIImage *);

@end
DPCATEGORY_VIEW_IMPLEMENTATION(UISwitch, DPSwitchChainModel)
#undef DPCATEGORY_CHAIN_SWITCH_IMPLEMENTATION
