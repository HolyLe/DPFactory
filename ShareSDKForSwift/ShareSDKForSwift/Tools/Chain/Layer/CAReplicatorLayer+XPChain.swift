//
//  CAReplicatorLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CAReplicatorLayer {
    
    @discardableResult
    func instanceCount(_ instanceCount : Int) -> XPChain {
        object.instanceCount = instanceCount
        return self
    }
    
    @discardableResult
    func preservesDepth(_ preservesDepth : Bool) -> XPChain {
        object.preservesDepth = preservesDepth
        return self
    }
    
    @discardableResult
    func instanceDelay(_ instanceDelay : CFTimeInterval) -> XPChain {
        object.instanceDelay = instanceDelay
        return self
    }
    
    @discardableResult
    func instanceTransform(_ instanceTransform : CATransform3D) -> XPChain {
        object.instanceTransform = instanceTransform
        return self
    }
    
    @discardableResult
    func instanceColor(_ instanceColor : CGColor?) -> XPChain {
        object.instanceColor = instanceColor
        return self
    }
    
    @discardableResult
    func instanceRedOffset(_ instanceRedOffset : Float) -> XPChain {
        object.instanceRedOffset = instanceRedOffset
        return self
    }
    
    @discardableResult
    func instanceGreenOffset(_ instanceGreenOffset : Float) -> XPChain {
        object.instanceGreenOffset = instanceGreenOffset
        return self
    }
    
    @discardableResult
    func instanceBlueOffset(_ instanceBlueOffset : Float) -> XPChain {
        object.instanceBlueOffset = instanceBlueOffset
        return self
    }
    
    @discardableResult
    func instanceAlphaOffset(_ instanceAlphaOffset : Float) -> XPChain {
        object.instanceAlphaOffset = instanceAlphaOffset
        return self
    }
}
