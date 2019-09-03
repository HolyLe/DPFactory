//
//  UITapGesture+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UITapGestureRecognizer {
    
    @discardableResult
    func numberOfTapsRequired(_ numberOfTapsRequired : Int) -> XPChain {
        object.numberOfTapsRequired = numberOfTapsRequired
        return self
    }
    
    @discardableResult
    func numberOfTouchesRequired(_ numberOfTouchesRequired : Int) -> XPChain {
        object.numberOfTouchesRequired = numberOfTouchesRequired
        return self
    }
}
