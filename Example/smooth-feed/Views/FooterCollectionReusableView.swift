//
//  FooterCollectionReusableView.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 21/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit

class FooterCollectionReusableView: UICollectionReusableView {
    
    static let reuseIdentifier = String(describing: FooterCollectionReusableView.self)

    @IBOutlet private var roundedBorderView: UIView!
    @IBOutlet private var addCommentLabel: UILabel!
    @IBOutlet private var discussButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        roundedBorderView.roundCorners([.layerMaxXMaxYCorner, .layerMinXMaxYCorner], radius: 40)
        roundedBorderView.layer.borderWidth = 1
        roundedBorderView.layer.borderColor = #colorLiteral(red: 0.9411764706, green: 0.9411764706, blue: 0.9411764706, alpha: 1).cgColor
        
        addCommentLabel.font = UIFont.medium
        discussButton.titleLabel?.font = UIFont.semibold
    }
}

private extension UIView {
    
    func roundCorners(_ corners: CACornerMask, radius: CGFloat) {
        if #available(iOS 11, *) {
            self.layer.cornerRadius = radius
            self.layer.maskedCorners = corners
        } else {
            var cornerMask = UIRectCorner()
            if corners.contains(.layerMinXMinYCorner) {
                cornerMask.insert(.topLeft)
            }
            if corners.contains(.layerMaxXMinYCorner) {
                cornerMask.insert(.topRight)
            }
            if corners.contains(.layerMinXMaxYCorner) {
                cornerMask.insert(.bottomLeft)
            }
            if corners.contains(.layerMaxXMaxYCorner) {
                cornerMask.insert(.bottomRight)
            }
            let path = UIBezierPath(roundedRect: self.bounds,
                                    byRoundingCorners: cornerMask,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }
}
