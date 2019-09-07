//
//  String+ShareSDK.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/6.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit
extension String {
    func toUnsafePointer() -> UnsafePointer<UInt8>? {
        guard let data = self.data(using: .utf8) else {
            return nil
        }
        
        let buffer = UnsafeMutablePointer<UInt8>.allocate(capacity: data.count)
        let stream = OutputStream(toBuffer: buffer, capacity: data.count)
        stream.open()
        let value = data.withUnsafeBytes {
            $0.baseAddress?.assumingMemoryBound(to: UInt8.self)
        }
        guard let val = value else {
            return nil
        }
        stream.write(val, maxLength: data.count)
        stream.close()
        
        return UnsafePointer<UInt8>(buffer)
    }
    
    func toUnsafeMutablePointer() -> UnsafeMutablePointer<Int8>? {
        return strdup(self)
    }
    
    func getClass() -> AnyClass? {
        guard let nameSpace = Bundle.main.infoDictionary!["CFBundleExecutable"] as? String else{ print("没有获取到命名空间")
            return nil
        }
        //2.根据字符串获取对应的Class
        guard let childVCClass = NSClassFromString(nameSpace + "." + self) else {
            return nil
        }
        return childVCClass
    }
    
    func color() -> UIColor {
        let blockInit : (_ white : CGFloat, _ alpha : CGFloat) -> UIColor = { white, alpha in
            return UIColor.init(white:white, alpha:alpha)
        }
        let count = self.count
        
        let lowString = self.lowercased()
        
        let blockSetting : (_ number : Int) -> UIColor = { number in
            if count < 6 + number {
                return blockInit(0,1)
            }
            let endIndex = count - 6 + number
            let start = lowString.index(lowString.startIndex, offsetBy: number)
            let hexEnd = lowString.index(start, offsetBy: 6)
            let alphaEnd = lowString.index(hexEnd, offsetBy: endIndex>2 ? 2 :endIndex)
            var hex = String(lowString[start..<hexEnd])
            let apha = String(lowString[hexEnd..<alphaEnd])
            switch apha.count {
            case 0:
                hex += "ff"
            case 1:
                hex += "0"+apha
            case 2:
                hex += apha
            default:
                break
            }
            let scanner = Scanner(string: hex)
            var hexNumber: UInt64 = 0
            let r, g, b, a: CGFloat
            if scanner.scanHexInt64(&hexNumber) {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
                return UIColor.init(red: r, green: g, blue: b, alpha: a)
            }else{
                return UIColor.white
            }
            
        }
        
        if lowString.hasPrefix("#") {
            return blockSetting(1)
        }else if(lowString.hasPrefix("0x")){
            return blockSetting(2)
        }else {
            return blockSetting(0)
        }
    }
    
    var localizedString:String{
        get{
            return NSLocalizedString(self, comment: self)
        }
    }
    
}
