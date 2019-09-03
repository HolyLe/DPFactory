//
//  UIPinchGesture+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIPinchGestureRecognizer {
    
    @discardableResult
    func scale(_ scale : CGFloat) -> XPChain {
        object.scale = scale
        return self
    }
}