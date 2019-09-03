//
//  XPChain+SnapKit.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/3.
//  Copyright © 2019 mob. All rights reserved.
//

import SnapKit

public extension XPChain where Base : UIView{
    
    @discardableResult
    func makeSnp(closure:(_ make: ConstraintMaker) -> Void) -> XPChain{
        object.snp.makeConstraints(closure)
        return self
    }
    
    @discardableResult
    func updateSnp(closure:(_ make: ConstraintMaker) -> Void) -> XPChain{
        object.snp.updateConstraints(closure)
        return self
    }
    
    @discardableResult
    func remakeSnp(closure:(_ make: ConstraintMaker) -> Void) -> XPChain{
        object.snp.remakeConstraints(closure)
        return self
    }
    
    @discardableResult
    func removeSnp() -> XPChain{
        object.snp.removeConstraints()
        return self
    }
}
