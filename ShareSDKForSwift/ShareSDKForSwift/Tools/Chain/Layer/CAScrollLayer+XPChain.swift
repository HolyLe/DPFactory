//
//  CAScrollLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CAScrollLayer {
    
    @discardableResult
    func scroll(to p: CGPoint) -> XPChain {
        object.scroll(to: p)
        return self
    }
    
    @discardableResult
    func scroll(to r: CGRect) -> XPChain {
        object.scroll(to: r)
        return self
    }
    
    @discardableResult
    func scrollMode(_ scrollMode : CAScrollLayerScrollMode) -> XPChain {
        object.scrollMode = scrollMode
        return self
    }
    
}

extension XPChain where Base : CALayer{
    @discardableResult
    func scroll(_ p: CGPoint) -> XPChain {
        object.scroll(p)
        return self
    }
    
    @discardableResult
    func scrollRectToVisible(_ r: CGRect) -> XPChain {
        object.scrollRectToVisible(r)
        return self
    }
}
