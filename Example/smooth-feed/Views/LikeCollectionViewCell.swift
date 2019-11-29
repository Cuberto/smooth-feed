//
//  LikeCollectionViewCell.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 26/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit

class LikeCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: LikeCollectionViewCell.self)
    
    @IBOutlet private var viewsLabel: UILabel!
    @IBOutlet private var likeButton: UIButton!
    @IBOutlet private var commentButton: UIButton!
    @IBOutlet private var shareButton: UIButton!
    
    func setup(with views: Int) {
        viewsLabel.text = "\(views) views"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        viewsLabel.font = UIFont.semibold
        
        likeButton.layer.cornerRadius = 18
        likeButton.layer.borderWidth = 1
        likeButton.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1).cgColor
        
        commentButton.layer.cornerRadius = 18
        commentButton.layer.borderWidth = 1
        commentButton.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1).cgColor
        
        shareButton.layer.cornerRadius = 18
        shareButton.layer.borderWidth = 1
        shareButton.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1).cgColor
    }
}
