//
//  CAShaperLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CAShapeLayer {
    
    @discardableResult
    func path(_ path : CGPath?) -> XPChain {
        object.path = path
        return self
    }
    
    @discardableResult
    func fillColor(_ fillColor : CGColor?) -> XPChain {
        object.fillColor = fillColor
        return self
    }
    
    @discardableResult
    func fillRule(_ fillRule : CAShapeLayerFillRule) -> XPChain {
        object.fillRule = fillRule
        return self
    }
    
    @discardableResult
    func strokeColor(_ strokeColor : CGColor?) -> XPChain {
        object.strokeColor = strokeColor
        return self
    }
    
    @discardableResult
    func strokeStart(_ strokeStart : CGFloat) -> XPChain {
        object.strokeStart = strokeStart
        return self
    }
    
    @discardableResult
    func strokeEnd(_ strokeEnd : CGFloat) -> XPChain {
        object.strokeEnd = strokeEnd
        return self
    }
    
    @discardableResult
    func lineWidth(_ lineWidth : CGFloat) -> XPChain {
        object.lineWidth = lineWidth
        return self
    }
    
    @discardableResult
    func miterLimit(_ miterLimit : CGFloat) -> XPChain {
        object.miterLimit = miterLimit
        return self
    }
    
    @discardableResult
    func lineCap(_ lineCap : CAShapeLayerLineCap) -> XPChain {
        object.lineCap = lineCap
        return self
    }
    
    @discardableResult
    func namelineJoin(_ lineJoin : CAShapeLayerLineJoin) -> XPChain {
        object.lineJoin = lineJoin
        return self
    }
    
    @discardableResult
    func lineDashPhase(_ lineDashPhase : CGFloat) -> XPChain {
        object.lineDashPhase = lineDashPhase
        return self
    }
    
    @discardableResult
    func lineDashPattern(_ lineDashPattern : [NSNumber]?) -> XPChain {
        object.lineDashPattern = lineDashPattern
        return self
    }
    
   
}
