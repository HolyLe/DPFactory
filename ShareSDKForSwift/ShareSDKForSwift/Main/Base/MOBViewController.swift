//
//  ViewController.swift
//  ShareSDKForSwift
//
//  Created by 麻小亮 on 2019/9/3.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit
import SnapKit


extension Array {
    func safeObject(_ index : Int) -> Element? {
        if self.count > index && index >= 0 {
            return self[index]
        }
        return nil
    }
}

class MobButton: UIButton {
    var isShouldEnable = false
    
    override var isHighlighted: Bool {
        set (new){
            if isShouldEnable {
                super.isHighlighted = new
            }
        }
        get {
            if isShouldEnable {
                return super.isHighlighted
            }
            return false
        }
    }
}

class MobShareTitleView: UIView {
    
    private var _dataSource : Array <String> = []
    private var _selectIndex : Int = 0
    private lazy var line : UIView = {
         UIView.init().make_chain.backgroundColor(.orange)
            .addToSuperView(self).object
    }()
    
    private var myselectedIndex : ((_ index : Int) -> Void)?
    
    var dataSource : Array<String>{
        get {
            return _dataSource
        }
        set (newDataSource){
            _dataSource = newDataSource
            layoutSubView()
        }
    }
    
    func layoutSubView() {
        while self.subviews.count > 0 {
            self.subviews.first?.removeFromSuperview()
        }
        let count = _dataSource.count
        
        for index in 0..<count {
            MobButton().make_chain
            .setTitle(dataSource[index], for: .normal)
            .setTitleColor(.black, for:.normal)
            .setTitleColor(.orange, for:.selected)
            .isSelected(_selectIndex == index)
            .tag(index)
            .addTarget(self, #selector(buttonClick(_:)), for: .touchUpInside)
            .addToSuperView(self)
            .makeSnp {
                var item : ConstraintItem?
                if let it = self.subviews.safeObject(index - 1)?.snp_right {
                    item = it
                }else{
                    item = self.snp_left
                }
                $0.left.equalTo(item!).offset(10);
                $0.top.equalTo(self).offset(0);
                if index + 1 == count {
                    $0.bottom.equalTo(self).offset(0)
                    $0.right.equalTo(self).offset(0)
                }
            }.object.isShouldEnable = _selectIndex != index
        }
        if count > 0 { 
            self.line.make_chain.makeSnp { (make) in
                make.centerX.width.equalTo(self.subviews[0])
                make.bottom.equalTo(self)
                make.height.equalTo(1)
            }
        }
    }
    @objc func buttonClick(_ button : MobButton) {
//        selectIndex(button.tag)
        if myselectedIndex != nil {
            myselectedIndex!(button.tag)
        }
    }
    func selectedIndex(_ clo: @escaping (_ index : Int) -> Void) {
        myselectedIndex = clo
    }
    func selectIndex(_ index : Int){
        if _selectIndex == index {return}
        let butt = self.subviews[_selectIndex] as! MobButton
        butt.isSelected = false
        butt.isShouldEnable = true
        _selectIndex = index
        let button = self.subviews[index] as! MobButton
        button.isSelected = true
        button.isShouldEnable = false
        UIView.animate(withDuration: 0.3) {
            self.line.make_chain.remakeSnp { (make) in
                make.centerX.equalTo(button)
                make.width.equalTo(button)
                make.bottom.equalTo(self)
                make.height.equalTo(1)
            }
            self.layoutIfNeeded()
        }
        
    }
}

class MOBViewController: UIViewController, UIScrollViewDelegate {
    lazy var titleView : MobShareTitleView = {
        let titleView = MobShareTitleView.init()
        titleView.dataSource = ["分享", "授权", "用户信息"]
        titleView.selectedIndex({ [unowned self](index) in
            self.selectedIndex(index)
        })
        return titleView
    }()
    
    let screenWidth = UIScreen.main.bounds.size.width
    let screenHeight = UIScreen.main.bounds.size.height
    lazy var _scrollView: UIScrollView = {
        UIScrollView()
        .make_chain
        .addToSuperView(self.view)
            .contentSize(CGSize.init(width: screenWidth * CGFloat(self.titleView.dataSource.count), height:screenHeight ))
        .delegate(self)
        .showsVerticalScrollIndicator(false)
        .showsHorizontalScrollIndicator(false)
        .makeSnp { (make) in
            make.edges.equalTo(0)
        }.object
    }()
    
    var viewControllers : [Any] = ["", "", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.titleView = titleView
    
        selectedIndex(0)
        
        // Do any additional setup after loading the view.
    }
    
    func selectedIndex(_ index : Int) {
        var vc = viewControllers[index]
        
        if vc is UIViewController {
            _scrollView.setContentOffset(CGPoint.init(x: screenWidth * CGFloat(index), y: 0), animated: true)
        }else{
            
            let childVcClass = getClassFromString(vc as? String) as? UIViewController.Type
            vc = childVcClass?.init() ?? UIViewController.init()
            viewControllers[index] = vc
            let viewController : UIViewController = vc as! UIViewController
            
            viewController.view.make_chain
            .addToSuperView(_scrollView)
            .backgroundColor(.red)
            .makeSnp { (make) in
                make.left.equalTo(screenWidth * CGFloat(index))
                make.top.equalTo(0)
                make.height.equalTo(screenHeight)
                make.width.equalTo(screenWidth)
            }
            
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        titleView.selectIndex(Int(ceil(scrollView.contentOffset.x / screenWidth + 0.5)))
    }
    
}

