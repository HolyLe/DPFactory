//
//  ViewController.swift
//  ShareSDKForSwift
//
//  Created by 麻小亮 on 2019/9/3.
//  Copyright © 2019 mob. All rights reserved.
//

import UIKit
import SnapKit


class MOBHeadPicterTableViewCell: UITableViewCell {
    
    lazy var picter : UIImageView = {
        UIImageView.init()
    }()
    
    lazy var nameLabel : UILabel = {
        UILabel.init()
    }()
    
    lazy var line : UIView = {
        UIView.init().make_chain.backgroundColor(.lightGray).object
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has @objc not been implemented")
    }
    
    func setup()  {
       picter.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.centerY.equalToSuperview()
       }
       nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(picter).offset(10)
            make.centerY.equalTo(picter)
       }
        
    }
    
    func updateModel(_ model: MOBPlatformModel) {
        
    }
}

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
     lazy var line : UIView = {
        UIView.init().make_chain.backgroundColor(.orange)
            .addToSuperView(self).object
    }()
    public var _currentSelectIndex : Int {
        get {
            return _selectIndex
        }
    }
    
    var selectAtIndex : ((_ index : Int) -> Void)?
    
    var dataSource : Array<String>{
        get {
            return _dataSource
        }
        set (newDataSource){
            _dataSource = newDataSource
            
            layoutTitles()
        }
    }
    
    func layoutTitles() {
        while self.subviews.count > 0 {
            self.subviews.first?.removeFromSuperview()
        }
        let count = _dataSource.count
        
        for index in 0..<count {
            MobButton().make_chain
            .setTitle(_dataSource[index], for: .normal)
            .setTitleColor(.black, for:.normal)
            .setTitleColor(.orange, for:.selected)
            .isSelected(_selectIndex == index)
            .tag(index)
            .addTarget(self, #selector(buttonClick(_:)), for: .touchUpInside)
            .addToSuperView(self)
            .makeSnp { make in
                var item : ConstraintItem?
                if let it = self.subviews.safeObject(index - 1)?.snp_right {
                    item = it
                }else{
                    item = self.snp_left
                }
                make.left.equalTo(item!).offset(10);
                make.top.equalTo(self).offset(0);
                if index + 1 == count {
                    make.bottom.equalTo(self).offset(0)
                    make.right.equalTo(self).offset(0)
                }
            }.object.isShouldEnable = _selectIndex != index
            
        }
        
        if count > 0 {
            line.make_chain.makeSnp { (make) in
                make.centerX.equalTo(self.subviews[_selectIndex])
                make.width.equalTo(self.subviews[_selectIndex])
                make.bottom.equalTo(self)
                make.height.equalTo(1)
            }
            if let select = selectAtIndex {
                select(_selectIndex)
            }
        }
    }
    
    @objc func buttonClick(_ button : MobButton) {
        if let select = selectAtIndex {
            select(button.tag)
        }
        selectIndex(button.tag)
    }
    
    func selectIndex(_ index : Int){
        if _selectIndex == index {return}
        let butt = self.subviews[_selectIndex] as! MobButton
        butt.isSelected = false
        butt.isShouldEnable = true
        let button = self.subviews[index] as! MobButton
        button.isSelected = true
        button.isShouldEnable = false
        UIView.animate(withDuration: 0.15) {
            self.line.make_chain.remakeSnp { (make) in
                make.centerX.equalTo(button)
                make.width.equalTo(button)
                make.bottom.equalTo(self)
                make.height.equalTo(1)
            }
            self.layoutIfNeeded()
        }
        _selectIndex = index
    }
}

class MOBViewController: UIViewController, UIScrollViewDelegate {
    var vcsCount = 0
    
    
    lazy var titleView : MobShareTitleView = {
        let _titleView = MobShareTitleView.init()
        _titleView.selectAtIndex = {[unowned self] index in
            self.selectedIndex(index)
        }
        _titleView.dataSource = ["分享", "授权", "用户信息"]
        
        return _titleView
    }()
    
    var screenWidth = UIScreen.main.bounds.size.width
    var screenHeight = UIScreen.main.bounds.size.height
    var _scrollView: UIScrollView?
    
    var viewControllers : [Any] = ["MOBShareViewController", "MOBAuthViewController", "MOBUserInfoViewController"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.edgesForExtendedLayout = .init(rawValue: 0)
        self.automaticallyAdjustsScrollViewInsets = false
        
        _scrollView = UIScrollView()
            .make_chain
            .addToSuperView(self.view)
            .delegate(self)
            .showsVerticalScrollIndicator(false)
            .showsHorizontalScrollIndicator(false)
            .bounces(false)
            .isDirectionalLockEnabled(true)
            .isPagingEnabled(true)
            .makeSnp { (make) in
                make.edges.equalTo(0)
        }.object
        
        _scrollView?.contentSize = CGSize.init(width: screenWidth * CGFloat(titleView.dataSource.count), height: screenHeight)
        self.navigationItem.titleView = titleView
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let currentScreenWidth = UIScreen.main.bounds.size.width
        let currentScreenHeight = UIScreen.main.bounds.size.height
        
        if currentScreenWidth==screenWidth && currentScreenHeight==screenHeight {
            return
        }
        screenWidth = currentScreenWidth
        screenHeight = currentScreenHeight
        _scrollView!.contentSize = CGSize.init(width: screenWidth * CGFloat(titleView.dataSource.count), height: screenHeight)
        vcsCount = 0
        for (index,item) in viewControllers.enumerated() {
            if item is UIViewController {
                resetLayoutWithViewController(index)
                vcsCount += 1
            }
        }
        _scrollView!.setContentOffset(CGPoint.init(x: CGFloat(titleView._currentSelectIndex) * screenWidth, y: _scrollView!.contentOffset.y), animated: false)
    }
    
    func selectedIndex(_ index : Int) {
        createVCAtIndex(index-1)
        createVCAtIndex(index)
        createVCAtIndex(index+1)
        vcsCount += 1
        _scrollView!.setContentOffset(CGPoint.init(x: self.view.frame.size.width * CGFloat(index), y: _scrollView!.contentOffset.y), animated: true)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let index = Int(scrollView.contentOffset.x / screenWidth + 0.5)
        if index == titleView._currentSelectIndex {
            return
        }
        selectedIndex(index)
        titleView.selectIndex(index)
    }
    
    func resetLayoutWithViewController(_ index : Int) {
        let item = viewControllers[index]
        let vc = item as! UIViewController
        vc.view.make_chain.remakeSnp { (make) in
            make.left.equalTo(screenWidth * CGFloat(index))
            make.top.height.equalToSuperview()
            make.width.equalTo(screenWidth)
            if vcsCount == 0 {
                make.bottom.equalTo(0)
                let rigthSpace = screenWidth * CGFloat(titleView.dataSource.count - index - 1)
                make.right.equalTo(-rigthSpace)
            }
        }
    }
    
    func createVCAtIndex(_ index : Int) {
        let vc = viewControllers.safeObject(index)
        if var object = vc {
            if object is String {
                let childVcClass = (object as! String).getClass() as? UIViewController.Type
                object = childVcClass?.init() ?? UIViewController.init()
                viewControllers[index] = object
                let viewController : UIViewController = object as! UIViewController
                let view = viewController.view!
                view.make_chain
                .addToSuperView(_scrollView!)
                resetLayoutWithViewController(index)
            }
        }
    }
}

