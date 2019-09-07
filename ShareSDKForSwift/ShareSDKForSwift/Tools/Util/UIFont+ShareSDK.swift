//
//  UIFont+ShareSDK.swift
//  ShareSDKForSwift
//
//  Created by 麻小亮 on 2019/9/7.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit


enum ShareSDKFontType {
    case System,
    PingFangLight,
    PingFangReguler,
    PingFangMedium,
    PingFangSemibold,
    STHeitiSCLight,
    STHeitiSCMedium,
    DinaAlternateBold
}

private let screenScale : CGFloat =  {
    let size = UIScreen.main.bounds.size
    return (size.width>size.height ? size.width:size.height)/375.0
}()
extension UIFont {
    private static let fontNames : [ShareSDKFontType:String] = [
        .PingFangLight : "PingFangSC-Light",
        .PingFangReguler : "PingFangSC-Regular",
        .PingFangMedium : "PingFangSC-Medium",
        .PingFangSemibold : "PingFangSC-Semibold",
        .STHeitiSCLight : "STHeitiSC-Light",
        .STHeitiSCMedium : "STHeitiSC-Medium",
        .DinaAlternateBold : "DINAlternate-Bold",
        .System : "",
    ]
    class func fontType(_ fontType : ShareSDKFontType, _ size : CGFloat) -> UIFont {
        let isSystem = fontType == .System
        if isSystem {
            return systemFont(ofSize: size)
        }
        let font = UIFont.init(name: fontNames[fontType]!, size: size)
        if let f = font {
            return f
        }else{
            return systemFont(ofSize: size)
        }
    }
    
    class func fontScaleType(_ fontType : ShareSDKFontType, _ size : CGFloat) -> UIFont {
        return UIFont.fontType(fontType, size)
    }
    class func System(_ size : CGFloat) -> UIFont {
        return fontType(.System, size)
    }
    class func PingFangLight( _ size : CGFloat) -> UIFont {
        return fontType(.PingFangLight, size)
    }
    class func PingFangReguler(_ size : CGFloat) -> UIFont {
        return fontType(.PingFangReguler, size)
    }
    class func PingFangMedium(_ size : CGFloat) -> UIFont {
        return fontType(.PingFangMedium, size)
    }
    class func PingFangSemibold(_ size : CGFloat) -> UIFont {
        return fontType(.PingFangSemibold, size)
    }
    class func STHeitiSCLight(_ size : CGFloat) -> UIFont {
        return fontType(.PingFangSemibold, size)
    }
    class func STHeitiSCMedium(_ size : CGFloat) -> UIFont {
        return fontType(.STHeitiSCMedium, size)
    }
    class func DinaAlternateBold(_ size : CGFloat) -> UIFont {
        return fontType(.DinaAlternateBold, size)
    }
    
}
