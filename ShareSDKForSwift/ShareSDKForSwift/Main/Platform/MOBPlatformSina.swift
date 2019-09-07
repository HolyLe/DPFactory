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
        .shareConfigure { (view, item, block) in
            print(item.name! + "222")
        }
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字+单图")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("文字+多图")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("故事版图片")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("视频")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("故事版视频")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("链接")
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("分享LinkCard")
    }.shareConfigure { (view, item, block) in
        print(item.name!)
    }.addShareItem {
        $0.itemParameter({ (para) in
                
        })
        .itemImage("")
        .itemName("分享LinkCard111")
        .shareConfigure { (view, item, block) in
            print("ma")
        }
    }.shareConfigure { (view, item, block) in
        print(item.name!)
    }
}
}()











