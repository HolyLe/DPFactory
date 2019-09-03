//
//  UIActivityIndicatorView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIActivityIndicatorView {
    
    @discardableResult
    func style(_ style : UIActivityIndicatorView.Style) -> XPChain {
        object.style = style
        return self
    }
    
    @discardableResult
    func hidesWhenStopped(_ hidesWhenStopped : Bool) -> XPChain {
        object.hidesWhenStopped = hidesWhenStopped
        return self
    }
    
    @discardableResult
    func color(_ color : UIColor!) -> XPChain {
        object.color = color
        return self
    }
}
