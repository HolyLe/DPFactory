//
//  CAGreadientLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CAGradientLayer {
    
    @discardableResult
    func colors(_ colors : [Any]?) -> XPChain {
        object.colors = colors
        return self
    }
    
    @discardableResult
    func locations(_ locations : [NSNumber]?) -> XPChain {
        object.locations = locations
        return self
    }
    
    @discardableResult
    func startPoint(_ startPoint : CGPoint) -> XPChain {
        object.startPoint = startPoint
        return self
    }
    
    @discardableResult
    func endPoint(_ endPoint : CGPoint) -> XPChain {
        object.endPoint = endPoint
        return self
    }
    
    @discardableResult
    func type(_ type : CAGradientLayerType) -> XPChain {
        object.type = type
        return self
    }
    
}
