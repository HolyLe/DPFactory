//
//  UITableView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
extension XPChain where Base : UITableView {
    
    @discardableResult
    func dataSource(_ dataSource : UITableViewDataSource?) -> XPChain {
        object.dataSource = dataSource
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UITableViewDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource : UITableViewDataSourcePrefetching?) -> XPChain {
        object.prefetchDataSource = prefetchDataSource
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func dragDelegate(_ dragDelegate : UITableViewDragDelegate?) -> XPChain {
        object.dragDelegate = dragDelegate
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func dropDelegate(_ dropDelegate : UITableViewDropDelegate?) -> XPChain {
        object.dropDelegate = dropDelegate
        return self
    }
    
    @discardableResult
    func rowHeight(_ rowHeight : CGFloat) -> XPChain {
        object.rowHeight = rowHeight
        return self
    }
    
    @discardableResult
    func sectionHeaderHeight(_ sectionHeaderHeight : CGFloat) -> XPChain {
        object.sectionHeaderHeight = sectionHeaderHeight
        return self
    }
    
    @discardableResult
    func sectionFooterHeight(_ sectionFooterHeight : CGFloat) -> XPChain {
        object.sectionFooterHeight = sectionFooterHeight
        return self
    }
    
    @discardableResult
    func estimatedRowHeight(_ estimatedRowHeight : CGFloat) -> XPChain {
        object.estimatedRowHeight = estimatedRowHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionHeaderHeight(_ estimatedSectionHeaderHeight : CGFloat) -> XPChain {
        object.estimatedSectionHeaderHeight = estimatedSectionHeaderHeight
        return self
    }
    
    @discardableResult
    func estimatedSectionFooterHeight(_ estimatedSectionFooterHeight : CGFloat) -> XPChain {
        object.estimatedSectionFooterHeight = estimatedSectionFooterHeight
        return self
    }
    
    @discardableResult
    func separatorInset(_ separatorInset : UIEdgeInsets) -> XPChain {
        object.separatorInset = separatorInset
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func separatorInsetReference(_ separatorInsetReference : UITableView.SeparatorInsetReference) -> XPChain {
        object.separatorInsetReference = separatorInsetReference
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func backgroundView(_ backgroundView : UIView?) -> XPChain {
        object.backgroundView = backgroundView
        return self
    }
    
    @discardableResult
    func scrollToRow(at indexPath: IndexPath, at scrollPosition: UITableView.ScrollPosition, animated: Bool) -> XPChain {
        object.scrollToRow(at: indexPath, at: scrollPosition, animated: animated)
        return self
    }
    
    @discardableResult
    func scrollToNearestSelectedRow(at scrollPosition: UITableView.ScrollPosition, animated: Bool) -> XPChain {
        object.scrollToNearestSelectedRow(at: scrollPosition, animated: animated)
        return self
    }
    @available(iOS 11.0, *)
    @discardableResult
    func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) -> XPChain {
        object.performBatchUpdates(updates, completion: completion)
        return self
    }
    
    @discardableResult
    func insertSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) -> XPChain {
        object.insertSections(sections, with: animation)
        return self
    }
    
    @discardableResult
    func deleteSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) -> XPChain {
        object.deleteSections(sections, with: animation)
        return self
    }
    
    @discardableResult
    func reloadSections(_ sections: IndexSet, with animation: UITableView.RowAnimation) -> XPChain {
        object.reloadSections(sections, with: animation)
        return self
    }
    
    @discardableResult
    func moveSection(_ section: Int, toSection newSection: Int) -> XPChain {
        object.moveSection(section, toSection: newSection)
        return self
    }
    
    @discardableResult
    func insertRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) -> XPChain {
        object.insertRows(at: indexPaths, with: animation)
        return self
    }
    
    @discardableResult
    func deleteRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) -> XPChain {
        object.deleteRows(at: indexPaths, with: animation)
        return self
    }
    
    @discardableResult
    func reloadRows(at indexPaths: [IndexPath], with animation: UITableView.RowAnimation) -> XPChain {
        object.reloadRows(at: indexPaths, with: animation)
        return self
    }
    
    @discardableResult
    func moveRow(at indexPath: IndexPath, to newIndexPath: IndexPath) -> XPChain {
        object.moveRow(at: indexPath, to: newIndexPath)
        return self
    }
    
    @discardableResult
    func setEditing(_ editing: Bool, animated: Bool) -> XPChain {
        object.setEditing(editing, animated: animated)
        return self
    }
    
    @discardableResult
    func allowsSelection(_ allowsSelection : Bool) -> XPChain {
        object.allowsSelection = allowsSelection
        return self
    }
    
    @discardableResult
    func allowsSelectionDuringEditing(_ allowsSelectionDuringEditing : Bool) -> XPChain {
        object.allowsSelectionDuringEditing = allowsSelectionDuringEditing
        return self
    }
    
    @discardableResult
    func allowsMultipleSelection(_ allowsMultipleSelection : Bool) -> XPChain {
        object.allowsMultipleSelection = allowsMultipleSelection
        return self
    }
    
    @discardableResult
    func allowsMultipleSelectionDuringEditing(_ allowsMultipleSelectionDuringEditing : Bool) -> XPChain {
        object.allowsMultipleSelectionDuringEditing = allowsMultipleSelectionDuringEditing
        return self
    }
    
    @discardableResult
    func selectRow(at indexPath: IndexPath?, animated: Bool, scrollPosition: UITableView.ScrollPosition) -> XPChain {
        object.selectRow(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        return self
    }
    
    @discardableResult
    func deselectRow(at indexPath: IndexPath, animated: Bool) -> XPChain {
        object.deselectRow(at: indexPath, animated: animated)
        return self
    }
    
    @discardableResult
    func namesectionIndexMinimumDisplayRowCount(_ sectionIndexMinimumDisplayRowCount : Int) -> XPChain {
        object.sectionIndexMinimumDisplayRowCount = sectionIndexMinimumDisplayRowCount
        return self
    }
    
    @discardableResult
    func sectionIndexColor(_ sectionIndexColor : UIColor?) -> XPChain {
        object.sectionIndexColor = sectionIndexColor
        return self
    }
    
    @discardableResult
    func sectionIndexBackgroundColor(_ sectionIndexBackgroundColor : UIColor?) -> XPChain {
        object.sectionIndexBackgroundColor = sectionIndexBackgroundColor
        return self
    }
    
    @discardableResult
    func sectionIndexTrackingBackgroundColor(_ sectionIndexTrackingBackgroundColor : UIColor?) -> XPChain {
        object.sectionIndexTrackingBackgroundColor = sectionIndexTrackingBackgroundColor
        return self
    }
    
    @discardableResult
    func separatorStyle(_ separatorStyle :  UITableViewCell.SeparatorStyle) -> XPChain {
        object.separatorStyle = separatorStyle
        return self
    }
    
    @discardableResult
    func separatorColor(_ separatorColor : UIColor?) -> XPChain {
        object.separatorColor = separatorColor
        return self
    }
    
    @discardableResult
    func separatorEffect(_ separatorEffect : UIVisualEffect?) -> XPChain {
        object.separatorEffect = separatorEffect
        return self
    }
    
    @discardableResult
    func cellLayoutMarginsFollowReadableWidth(_ cellLayoutMarginsFollowReadableWidth : Bool) -> XPChain {
        object.cellLayoutMarginsFollowReadableWidth = cellLayoutMarginsFollowReadableWidth
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func insetsContentViewsToSafeArea(_ insetsContentViewsToSafeArea : Bool) -> XPChain {
        object.insetsContentViewsToSafeArea = insetsContentViewsToSafeArea
        return self
    }
    
    @discardableResult
    func tableHeaderView(_ tableHeaderView : UIView?) -> XPChain {
        object.tableHeaderView = tableHeaderView
        return self
    }
    
    @discardableResult
    func tableFooterView(_ tableFooterView : UIView?) -> XPChain {
        object.tableFooterView = tableFooterView
        return self
    }
    
    @discardableResult
    func register(_ nib: UINib?, forCellReuseIdentifier identifier: String) -> XPChain {
        object.register(nib, forCellReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register(_ cellClass: AnyClass?, forCellReuseIdentifier identifier: String) -> XPChain {
        object.register(cellClass, forCellReuseIdentifier: identifier)
        return self
    }

    @discardableResult
    func register(_ nib: UINib?, forHeaderFooterViewReuseIdentifier identifier: String) -> XPChain {
        object.register(nib, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register(_ aClass: AnyClass?, forHeaderFooterViewReuseIdentifier identifier: String) -> XPChain {
        object.register(aClass, forHeaderFooterViewReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath : Bool) -> XPChain {
        object.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func dragInteractionEnabled(_ dragInteractionEnabled : Bool) -> XPChain {
        object.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
    
}
