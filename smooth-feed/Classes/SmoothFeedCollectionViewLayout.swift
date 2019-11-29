//
//  SmoothFeedCollectionViewLayout.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 26/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit

open class SmoothFeedCollectionViewLayout: UICollectionViewLayout {
    
    open var itemHeight: CGFloat = 0
    open var estimatedItemHeight: CGFloat = 0 // setting a non-zero height enables cells that self-size via heightFitting(width:)
    open var itemsInSectionMaxHeight: CGFloat = 0
    open var headerHeight: CGFloat = 0
    open var footerHeight: CGFloat = 0
    
    open var offset: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        if #available(iOS 11.0, *) {
            return collectionView.contentOffset.y + collectionView.safeAreaInsets.top
        } else {
            return collectionView.contentOffset.y
        }
    }
    
    private var defaultItemHeight: CGFloat {
        return estimatedItemHeight > 0 ? estimatedItemHeight : itemHeight
    }
    
    private var contentWidth: CGFloat {
        return collectionView?.bounds.width ?? 0
    }
    
    private var itemHeightCache = [IndexPath: CGFloat]()
    
    override open var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return CGSize.zero }
        return CGSize(width: collectionView.bounds.width, height: sectionY(for: collectionView.numberOfSections))
    }
    
    override open func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        guard let collectionView = collectionView else { return nil }
        var result = [UICollectionViewLayoutAttributes]()
        for section in 0..<collectionView.numberOfSections {
            let headerAttributes = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                        at: IndexPath(item: 0, section: section))
            if let headerAttributes = headerAttributes, headerAttributes.frame.intersects(rect) {
                result.append(headerAttributes)
            }
            let footerAttributes = layoutAttributesForSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                        at: IndexPath(item: 0, section: section))
            if let footerAttributes = footerAttributes, footerAttributes.frame.intersects(rect) {
                result.append(footerAttributes)
            }
            for item in 0..<collectionView.numberOfItems(inSection: section) {
                let itemAttributes = layoutAttributesForItem(at: IndexPath(item: item, section: section))
                if let itemAttributes = itemAttributes, itemAttributes.frame.intersects(rect) {
                    result.append(itemAttributes)
                }
            }
        }
        return result
    }

    override open func layoutAttributesForSupplementaryView(ofKind elementKind: String, at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forSupplementaryViewOfKind: elementKind, with: indexPath)
        let secY = sectionY(for: indexPath.section)
        switch elementKind {
        case UICollectionView.elementKindSectionHeader:
            let y = secY + headerOffset(offset: offset, y: secY, section: indexPath.section)
            attributes.frame = CGRect(x: 0, y: y, width: contentWidth, height: headerHeight)
        case UICollectionView.elementKindSectionFooter:
            let y = secY + headerHeight + itemsHeight(in: indexPath.section)
            attributes.frame = CGRect(x: 0, y: y, width: contentWidth, height: footerHeight)
        default:
            return nil
        }
        return attributes
    }
    
    override open func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
        let y = sectionY(for: indexPath.section)
        let height = itemHeight(at: indexPath)
        let offsettedItemY = itemY(for: indexPath) + itemOffset(offset: offset, y: y, section: indexPath.section)
        let itemY = y + headerHeight + offsettedItemY
        attributes.frame = CGRect(x: 0, y: itemY, width: contentWidth, height: height)
        attributes.zIndex = -1
        attributes.isHidden = offsettedItemY >= itemsInSectionMaxHeight
        return attributes
    }
    
    private func sectionY(for section: Int) -> CGFloat {
        let y = (0..<section).reduce(CGFloat(0)) { first, section in first + sectionHeight(section: section) }
        return y
    }
    
    private func sectionHeight(section: Int) -> CGFloat {
        return headerHeight + footerHeight + itemsHeight(in: section)
    }
    
    private func itemsHeight(in section: Int) -> CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let numberOfItems = collectionView.numberOfItems(inSection: section)
        let height = itemY(for: IndexPath(item: numberOfItems, section: section))
        return min(height, itemsInSectionMaxHeight)
    }
    
    private func headerOffset(offset: CGFloat, y: CGFloat, section: Int) -> CGFloat {
        let dividedOffset = (offset - y) * 0.5
        let height = itemsHeight(in: section)
        if dividedOffset >= height {
            return height
        } else if dividedOffset <= 0 {
            return 0
        } else {
            return dividedOffset
        }
    }
    
    private func itemY(for indexPath: IndexPath) -> CGFloat {
        let y = (0..<indexPath.item).reduce(CGFloat(0)) { first, item in
            return first + (itemHeightCache[IndexPath(item: item, section: indexPath.section)] ?? defaultItemHeight)
        }
        return y
    }
    
    private func itemOffset(offset: CGFloat, y: CGFloat, section: Int) -> CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let dividedOffset = (offset - y) * 0.5
        let maxHeight = itemsInSectionMaxHeight
        let lastIndexPathInSection = IndexPath(item: collectionView.numberOfItems(inSection: section) - 1, section: section)
        let delta = itemHeight(at: lastIndexPathInSection) * 1.5 // for make cells move faster => last cell showing earlier
        let numberOfItems = collectionView.numberOfItems(inSection: section)
        let itemsHeight = itemY(for: IndexPath(item: numberOfItems, section: section))
        
        guard dividedOffset > 0, itemsHeight > maxHeight else { return 0 }
        let diff = itemsHeight - maxHeight
        let result = -dividedOffset / maxHeight * (diff + delta)
        return result <= -diff ? -diff : result
    }
    
    private func itemHeight(at indexPath: IndexPath) -> CGFloat {
        guard estimatedItemHeight > 0 else { return itemHeight }
        if let height = itemHeightCache[indexPath] {
            return height
        } else {
            let smoothView = collectionView?.cellForItem(at: indexPath) as? SmoothFeedCollectionReusableView
            if let height = smoothView?.heightFitting(width: contentWidth) {
                itemHeightCache[indexPath] = height
                return height
            } else {
                return estimatedItemHeight
            }
        }
    }
}

