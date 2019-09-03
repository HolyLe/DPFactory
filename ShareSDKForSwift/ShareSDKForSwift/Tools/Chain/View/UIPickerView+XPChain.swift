//
//  UIPickerView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UIPickerView {
    
    @discardableResult
    func dataSource(_ dataSource : UIPickerViewDataSource?) -> XPChain {
        object.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UIPickerViewDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func showsSelectionIndicator(_ showsSelectionIndicator : Bool) -> XPChain {
        object.showsSelectionIndicator = showsSelectionIndicator
        return self
    }
    
    @discardableResult
    func reloadComponent(_ reloadComponent : Int) -> XPChain {
        object.reloadComponent(reloadComponent)
        return self
    }
    
    @discardableResult
    func selectRow(_ row: Int, inComponent component: Int, animated: Bool) -> XPChain {
        object.selectRow(row, inComponent: component, animated: animated)
        return self
    }
}
