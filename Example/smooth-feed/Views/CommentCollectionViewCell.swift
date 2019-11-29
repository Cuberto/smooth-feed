//
//  CommentCollectionViewCell.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 21/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit
import smooth_feed

struct Comment {
    let avatar: UIImage?
    let name: String
    let text: String
    let hours: Int
    let likes: Int
}

class CommentCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: CommentCollectionViewCell.self)
    
    @IBOutlet private var avatarImageView: UIImageView!
    @IBOutlet private var textLabel: UILabel!
    @IBOutlet private var dateLabel: UILabel!
    @IBOutlet private var likesLabel: UILabel!
    @IBOutlet private var replyLabel: UILabel!
    
    func setup(with comment: Comment) {
        avatarImageView.image = comment.avatar
        textLabel.attributedText = attributedText(name: comment.name, text: comment.text)
        dateLabel.text = "\(comment.hours) h"
        likesLabel.text = comment.likes == 1 ? "\(comment.likes) like" : "\(comment.likes) likes"
        likesLabel.isHidden = comment.likes == 0
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        replyLabel.text = "Reply"
        dateLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        likesLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        replyLabel.textColor = UIColor.black.withAlphaComponent(0.4)
        dateLabel.font = UIFont.medium
        likesLabel.font = UIFont.semibold
        replyLabel.font = UIFont.semibold
    }
    
    private func attributedText(name: String, text: String) -> NSAttributedString {
        let font = UIFont.medium
        let string = "\(name)  \(text)"
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 3
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: [.font: font,
                         .foregroundColor: UIColor.black,
                         .paragraphStyle: style]
        )
        
        guard let argumentRange = string.range(of: name) else { return attributedString }
        let argumentFontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.semibold,
            .foregroundColor: UIColor.black
        ]
        attributedString.addAttributes(argumentFontAttributes, range: NSRange(argumentRange, in: string))
        return attributedString
    }
}

extension CommentCollectionViewCell: SmoothFeedCollectionReusableView {

    func heightFitting(width: CGFloat) -> CGFloat {
        return systemLayoutSizeFitting(
            CGSize(width: width, height: 0),
            withHorizontalFittingPriority: .required,
            verticalFittingPriority: .fittingSizeLevel
        ).height
    }
}
