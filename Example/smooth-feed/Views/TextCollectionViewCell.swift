//
//  TextCollectionViewCell.swift
//  smooth-feed
//
//  Created by Denis Shvetsov on 26/11/2019.
//  Copyright © 2019 Cuberto. All rights reserved.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    
    static let reuseIdentifier = String(describing: TextCollectionViewCell.self)
    
    @IBOutlet private var textLabel: UILabel!
    
    func setup(with text: String) {
        textLabel.attributedText = attributedText(text: text, more: "more")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let comment = "Friendly rate choice (for #fun) 😅\nDon’t forget click ❤️ 😉"
        textLabel.attributedText = attributedText(text: comment, more: "more")
    }
    
    private func attributedText(text: String, more: String) -> NSAttributedString {
        let font = UIFont.medium
        let string = "\(text)   \(more)"
        let style = NSMutableParagraphStyle()
        style.lineSpacing = 5
        let attributedString = NSMutableAttributedString(
            string: string,
            attributes: [.font: font,
                         .foregroundColor: UIColor.black,
                         .paragraphStyle: style]
        )
        
        guard let argumentRange = string.range(of: more) else { return attributedString }
        let argumentFontAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.semibold,
            .foregroundColor: UIColor.black
        ]
        attributedString.addAttributes(argumentFontAttributes, range: NSRange(argumentRange, in: string))
        return attributedString
    }

}
