//
//  TweetCell.swift
//  Twitter
//
//  Created by Andy Stef on 1/19/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
            guard let tweet = datasourceItem as? Tweet else { return }

            let  attributedText = NSMutableAttributedString(string: tweet.user.name, attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 16)])
            let usernameString = "   \(tweet.user.username)\n"
            attributedText.append(NSAttributedString(string: usernameString , attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.gray]))

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = 4
            let range = NSMakeRange(0, attributedText.string.characters.count)
            attributedText.addAttribute(NSParagraphStyleAttributeName, value: paragraphStyle, range: range)

            attributedText.append(NSAttributedString(string: tweet.message, attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15)]))



            messageTextView.attributedText = attributedText
        }
    }

    let messageTextView: UITextView = {
        let textView = UITextView()

        return textView
    }()

    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true
        image.image = #imageLiteral(resourceName: "iron")

        return image
    }()

    override func setupViews() {
        super.setupViews()

        backgroundColor = .white
        separatorLineView.isHidden = false

        addSubview(profileImageView)
        addSubview(messageTextView)

        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
