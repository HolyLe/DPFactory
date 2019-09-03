//
//  CATiledLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CATiledLayer {
    
    @discardableResult
    func levelsOfDetail(_ levelsOfDetail : Int) -> XPChain {
        object.levelsOfDetail = levelsOfDetail
        return self
    }
    
    @discardableResult
    func levelsOfDetailBias(_ levelsOfDetailBias : Int) -> XPChain {
        object.levelsOfDetailBias = levelsOfDetailBias
        return self
    }
    
    @discardableResult
    func tileSize(_ tileSize : CGSize) -> XPChain {
        object.tileSize = tileSize
        return self
    }
    
}
