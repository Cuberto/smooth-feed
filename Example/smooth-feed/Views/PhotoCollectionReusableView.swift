//
//  PhotoCollectionReusableView.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 21/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit

class PhotoCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = String(describing: PhotoCollectionReusableView.self)
    
    @IBOutlet var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
