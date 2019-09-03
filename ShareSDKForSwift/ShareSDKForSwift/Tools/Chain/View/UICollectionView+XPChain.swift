//
//  UICollectionView+XPChain.swift
//  SwiftStudy
//
//  Created by 麻小亮 on 2019/5/21.
//  Copyright © 2019 麻小亮. All rights reserved.
//

import UIKit

extension XPChain where Base : UICollectionView {
    
    @discardableResult
    func collectionViewLayout(_ collectionViewLayout : UICollectionViewLayout) -> XPChain {
        object.collectionViewLayout = collectionViewLayout
        return self
    }
    
    @discardableResult
    func delegate(_ delegate : UICollectionViewDelegate?) -> XPChain {
        object.delegate = delegate
        return self
    }
    
    @discardableResult
    func dataSource(_ dataSource : UICollectionViewDataSource?) -> XPChain {
        object.dataSource = dataSource
        return self
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func prefetchDataSource(_ prefetchDataSource : UICollectionViewDataSourcePrefetching?) -> XPChain {
        object.prefetchDataSource = prefetchDataSource
        return self
    }
    
    @available(iOS 10.0, *)
    @discardableResult
    func isPrefetchingEnabled(_ isPrefetchingEnabled : Bool) -> XPChain {
        object.isPrefetchingEnabled = isPrefetchingEnabled
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func dragDelegate(_ dragDelegate : UICollectionViewDragDelegate?) -> XPChain {
        object.dragDelegate = dragDelegate
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func dropDelegate(_ dropDelegate : UICollectionViewDropDelegate?) -> XPChain {
        object.dropDelegate = dropDelegate
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func dragInteractionEnabled(_ dragInteractionEnabled : Bool) -> XPChain {
        object.dragInteractionEnabled = dragInteractionEnabled
        return self
    }
    
    @available(iOS 11.0, *)
    @discardableResult
    func reorderingCadence(_ reorderingCadence : UICollectionView.ReorderingCadence) -> XPChain {
        object.reorderingCadence = reorderingCadence
        return self
    }
    
    @discardableResult
    func backgroundView(_ backgroundView : UIView?) -> XPChain {
        object.backgroundView = backgroundView
        return self
    }
    
    @discardableResult
    func register(_ cellClass: AnyClass?, forCellWithReuseIdentifier identifier: String) -> XPChain {
        object.register(cellClass, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register(_ nib: UINib?, forCellWithReuseIdentifier identifier: String) -> XPChain {
        object.register(nib, forCellWithReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register(_ viewClass: AnyClass?, forSupplementaryViewOfKind elementKind: String, withReuseIdentifier identifier: String) -> XPChain {
        object.register(viewClass, forSupplementaryViewOfKind: elementKind, withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func register(_ nib: UINib?, forSupplementaryViewOfKind kind: String, withReuseIdentifier identifier: String) -> XPChain {
        object.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
        return self
    }
    
    @discardableResult
    func allowsSelection(_ allowsSelection : Bool) -> XPChain {
        object.allowsSelection = allowsSelection
        return self
    }
    
    @discardableResult
    func allowsMultipleSelection(_ allowsMultipleSelection : Bool) -> XPChain {
        object.allowsMultipleSelection = allowsMultipleSelection
        return self
    }
    
    @discardableResult
    func selectItem(at indexPath: IndexPath?, animated: Bool, scrollPosition: UICollectionView.ScrollPosition) -> XPChain {
        object.selectItem(at: indexPath, animated: animated, scrollPosition: scrollPosition)
        return self
    }
    
    @discardableResult
    func deselectItem(at indexPath: IndexPath, animated: Bool) -> XPChain {
        object.deselectItem(at: indexPath, animated: animated)
        return self
    }
    
    @discardableResult
    func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool) -> XPChain {
        object.setCollectionViewLayout(layout, animated: animated)
        return self
    }
    
    @discardableResult
    func setCollectionViewLayout(_ layout: UICollectionViewLayout, animated: Bool, completion: ((Bool) -> Void)? = nil) -> XPChain {
        object.setCollectionViewLayout(layout, animated: animated, completion: completion)
        return self
    }
    
    @discardableResult
    func scrollToItem(at indexPath: IndexPath, at scrollPosition: UICollectionView.ScrollPosition, animated: Bool) -> XPChain {
        object.scrollToItem(at: indexPath, at: scrollPosition, animated: animated)
        return self
    }
    
    @discardableResult
    func performBatchUpdates(_ updates: (() -> Void)?, completion: ((Bool) -> Void)? = nil) -> XPChain {
        object.performBatchUpdates(updates, completion: completion)
        return self
    }
    
    @discardableResult
    func remembersLastFocusedIndexPath(_ remembersLastFocusedIndexPath : Bool) -> XPChain {
        object.remembersLastFocusedIndexPath = remembersLastFocusedIndexPath
        return self
    }
    
    @discardableResult
    func insertSections(_ sections: IndexSet) -> XPChain {
        object.insertSections(sections)
        return self
    }
    
    @discardableResult
    func deleteSections(_ sections: IndexSet) -> XPChain {
        object.deleteSections(sections)
        return self
    }
    
    @discardableResult
    func reloadSections(_ sections: IndexSet) -> XPChain {
        object.reloadSections(sections)
        return self
    }
    
    @discardableResult
    func moveSection(_ section: Int, toSection newSection: Int) -> XPChain {
        object.moveSection(section, toSection: newSection)
        return self
    }
    
    @discardableResult
    func insertItems(at indexPaths: [IndexPath]) -> XPChain {
        object.insertItems(at: indexPaths)
        return self
    }
    
    @discardableResult
    func deleteItems(at indexPaths: [IndexPath]) -> XPChain {
        object.deleteItems(at: indexPaths)
        return self
    }
    
    @discardableResult
    func reloadItems(at indexPaths: [IndexPath]) -> XPChain {
        object.reloadItems(at: indexPaths)
        return self
    }
    
    @discardableResult
    func moveItem(at indexPath: IndexPath, to newIndexPath: IndexPath) -> XPChain {
        object.moveItem(at: indexPath, to: newIndexPath)
        return self
    }
}
