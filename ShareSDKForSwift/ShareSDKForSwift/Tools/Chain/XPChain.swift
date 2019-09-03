//
//  XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/20.
//  Copyright © 2019 麻小亮. All rights reserved.
//


import UIKit

public struct XPChain <Base> {
    
    public var object : Base {
        get {
          return obj
        }
    }
    
    private var obj : Base
    
    public init (_ object : Base){
        self.obj = object
    }
}


public extension NSObjectProtocol{

    var make_chain : XPChain <Self>{
        return XPChain<Self>.init(self)

    }
}

extension XPChain where Base : NSObjectProtocol {
    @discardableResult
    
    func other(by :(_ object : Base)->Void) -> XPChain {
        by(object)
    
        return self
    }
}
