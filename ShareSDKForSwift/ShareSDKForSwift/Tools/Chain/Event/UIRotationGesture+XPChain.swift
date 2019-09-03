//
//  UIRotationGesture+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIRotationGestureRecognizer {
    
    @discardableResult
    func rotation(_ rotation : CGFloat) -> XPChain {
        object.rotation = rotation
        return self
    }
}
