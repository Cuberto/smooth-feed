//
//  ViewController.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 11/29/2019.
//  Copyright (c) 2019 Cuberto. All rights reserved.
//

import UIKit
import smooth_feed

class ViewController: UIViewController {
    
    @IBOutlet private var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.register(UINib(nibName: CommentCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: CommentCollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: AuthorCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: AuthorCollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: LikeCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: LikeCollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: TextCollectionViewCell.reuseIdentifier, bundle: nil),
                                forCellWithReuseIdentifier: TextCollectionViewCell.reuseIdentifier)
        collectionView.register(UINib(nibName: PhotoCollectionReusableView.reuseIdentifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: PhotoCollectionReusableView.reuseIdentifier)
        collectionView.register(UINib(nibName: FooterCollectionReusableView.reuseIdentifier, bundle: nil),
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                withReuseIdentifier: FooterCollectionReusableView.reuseIdentifier)
        collectionView.alwaysBounceVertical = true
        collectionView.dataSource = self
        
        let layout = SmoothFeedCollectionViewLayout()
        layout.estimatedItemHeight = 76
        layout.itemsInSectionMaxHeight = 304
        layout.footerHeight = 90
        layout.headerHeight = UIScreen.main.bounds.width
        collectionView.collectionViewLayout = layout
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = items[indexPath.section][indexPath.item]
        switch item {
        case .like(let likes):
            let reuseIdentifier = LikeCollectionViewCell.reuseIdentifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                          for: indexPath) as! LikeCollectionViewCell
            cell.setup(with: likes)
            return cell
        case .author:
            let reuseIdentifier = AuthorCollectionViewCell.reuseIdentifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                          for: indexPath) as! AuthorCollectionViewCell
            return cell
        case .text(let text):
            let reuseIdentifier = TextCollectionViewCell.reuseIdentifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                          for: indexPath) as! TextCollectionViewCell
            cell.setup(with: text)
            return cell
        case .comment(let comment):
            let reuseIdentifier = CommentCollectionViewCell.reuseIdentifier
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                          for: indexPath) as! CommentCollectionViewCell
            cell.setup(with: comment)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        viewForSupplementaryElementOfKind kind: String,
                        at indexPath: IndexPath) -> UICollectionReusableView {
        let reuseIdentifier: String
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            reuseIdentifier = PhotoCollectionReusableView.reuseIdentifier
        case UICollectionView.elementKindSectionFooter:
            reuseIdentifier = FooterCollectionReusableView.reuseIdentifier
        default:
            fatalError("unexpected kind")
        }
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                                withReuseIdentifier: reuseIdentifier,
                                                                                for: indexPath)
        let photo = supplementaryView as? PhotoCollectionReusableView
        photo?.imageView.image = [#imageLiteral(resourceName: "photo"), #imageLiteral(resourceName: "photo2")][indexPath.section % 2]
        return supplementaryView
    }
}
