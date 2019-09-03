//
//  CATextLayer+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : CATextLayer {
    
    @discardableResult
    func string(_ string : Any?) -> XPChain {
        object.string = string
        return self
    }
    
    @discardableResult
    func font(_ font : CFTypeRef?) -> XPChain {
        object.font = font
        return self
    }
    
    @discardableResult
    func fontSize(_ fontSize : CGFloat) -> XPChain {
        object.fontSize = fontSize
        return self
    }
    
    @discardableResult
    func foregroundColor(_ foregroundColor : CGColor?) -> XPChain {
        object.foregroundColor = foregroundColor
        return self
    }
    
    @discardableResult
    func isWrapped(_ isWrapped : Bool) -> XPChain {
        object.isWrapped = isWrapped
        return self
    }
    
    @discardableResult
    func truncationMode(_ truncationMode : CATextLayerTruncationMode) -> XPChain {
        object.truncationMode = truncationMode
        return self
    }
    
    @discardableResult
    func alignmentMode(_ alignmentMode : CATextLayerAlignmentMode) -> XPChain {
        object.alignmentMode = alignmentMode
        return self
    }
    
    @discardableResult
    func allowsFontSubpixelQuantization(_ allowsFontSubpixelQuantization : Bool) -> XPChain {
        object.allowsFontSubpixelQuantization = allowsFontSubpixelQuantization
        return self
    }
    
}
