//
//  MOBBaseViewProtocol.swift
//  ShareSDKForSwift
//
//  Created by maxl on 2019/9/4.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit

class MOBTabeViewProtocolConfigure : NSObject {
    
    /// 样式
    var style = UITableView.Style.plain
    
    /// clas
    var clas : String?
    
    /// 是否自己设置布局
    var layoutCustom = false
    
    /// 回调
    var tableView : ((_ tableView : UITableView) -> Void)?
    
}

@objc protocol MOBTableViewProtocol : UITableViewDelegate, UITableViewDataSource {
    
    var tableView : UITableView? { get }
    
    
    /// 配置tableView信息
    /// - Parameter configure: 配置model
    @objc optional func configureTableView(_ configure : MOBTabeViewProtocolConfigure)
    
    
}

extension MOBTableViewProtocol where Self : UIViewController{
    
    
    var tableViewModel : MOBTabeViewProtocolConfigure{
        get{
            var objc = objc_getAssociatedObject(self, "MOB_TableViewModel")
            if objc == nil {
                objc = MOBTabeViewProtocolConfigure.init()
                objc_setAssociatedObject(self, "MOB_TableViewModel", objc, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return objc as! MOBTabeViewProtocolConfigure
        }
    }
    
    
    
    var tableView: UITableView {
        get{
            var objc = objc_getAssociatedObject(self, "MOB_TableView")
            if objc == nil {
                if let method = configureTableView {
                    method(tableViewModel)
                }
                var tableViewClass : UITableView.Type?
                if let clas = tableViewModel.clas {
                    tableViewClass = clas.getClass() as? UITableView.Type
                }
                if (tableViewClass == nil) {
                    tableViewClass = UITableView.self
                }
                objc = tableViewClass!.init(frame: .zero, style: tableViewModel.style).make_chain
                    .delegate(self)
                    .dataSource(self)
                    .showsVerticalScrollIndicator(false)
                    .showsHorizontalScrollIndicator(false)
                    .separatorStyle(.none)
                    .addToSuperView(view)
                    .makeSnp(closure: { (make) in
                        make.edges.equalTo(0)
                    })
                    .object
                if let call = tableViewModel.tableView {
                    call(objc as! UITableView)
                }
                objc_setAssociatedObject(self, "MOB_TableView", objc, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            }
            return objc as! UITableView
        }
    }
}

@objc protocol MOBTableViewCellProtocol {
    @objc func model(_ model : AnyObject) -> Self
    @objc optional func updateModel (_ model : AnyObject)
}

extension UITableViewCell : MOBTableViewCellProtocol {
    func model(_ model: AnyObject) -> Self {
        
        let sel = sel_registerName(("updateModel:".toUnsafeMutablePointer())!)
        if self.responds(to: sel) {
            self.perform(sel, with: model)
        }
        return self
    }
}
