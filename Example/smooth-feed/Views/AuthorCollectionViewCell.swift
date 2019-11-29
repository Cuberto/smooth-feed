//
//  AuthorCollectionViewCell.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 26/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit
import smooth_feed

class AuthorCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: AuthorCollectionViewCell.self)
    
    @IBOutlet private var borderView: UIView!
    @IBOutlet private var imageView: UIImageView!
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        borderView.layer.cornerRadius = 26
        borderView.layer.borderWidth = 1
        borderView.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1).cgColor
        
        nameLabel.font = UIFont.semibold
        
        dateLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        dateLabel.font = UIFont.medium
    }
}

extension AuthorCollectionViewCell: SmoothFeedCollectionReusableView {

    func heightFitting(width: CGFloat) -> CGFloat {
        return 60
    }
}
