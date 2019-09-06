//
//  String+ShareSDK.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/6.
//  Copyright © 2019 mob. All rights reserved.
//

import Foundation
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
}
