//
//  MOBPlatformQQModel.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import Foundation




let Sina : MOBPlatformModel = { MOBPlatformModel.init(forPlatform: 1).configureShareInfo { (shareModel) in
    shareModel.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字")
    }.shareConfigure { (view, item, block) in
        print(item.name!)
    }
}
}()











