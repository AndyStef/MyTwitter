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
            profileImageView.loadImage(urlString: tweet.user.profileImageUrl)
        }
    }

    let messageTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear

        return textView
    }()

    let profileImageView: CachedImageView = {
        let image = CachedImageView()
        image.layer.cornerRadius = 5
        image.layer.masksToBounds = true

        return image
    }()

    let replyButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "ArrowLeft"), for: .normal)
        button.tintColor = .black

        return button
    }()

    let retweetButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "retweet"), for: .normal)
        button.tintColor = .black

        return button
    }()

    let likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Like"), for: .normal)
        button.tintColor = .black

        return button
    }()

    let messageButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "Message"), for: .normal)
        button.tintColor = .black

        return button
    }()

    override func setupViews() {
        super.setupViews()

        backgroundColor = .white
        separatorLineView.isHidden = false

        addSubview(profileImageView)
        addSubview(messageTextView)

        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
        messageTextView.anchor(topAnchor, left: profileImageView.rightAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 4, leftConstant: 4, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        setupBottomButtons()
    }

    private func setupBottomButtons() {
        let replyButtonContainerView = UIView()
        let retweetButtonContainerView = UIView()
        let likeButtonContainerView = UIView()
        let sendButtonContainerView = UIView()

        let buttonStackView = UIStackView(arrangedSubviews: [replyButtonContainerView, retweetButtonContainerView, likeButtonContainerView, sendButtonContainerView])
        buttonStackView.axis = .horizontal
        buttonStackView.distribution = .fillEqually

        addSubview(buttonStackView)
        buttonStackView.anchor(nil, left: messageTextView.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 4, rightConstant: 4, widthConstant: 0, heightConstant: 20)

        addSubview(replyButton)
        addSubview(retweetButton)
        addSubview(likeButton)
        addSubview(messageButton)

        replyButton.anchor(replyButtonContainerView.topAnchor, left: replyButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        retweetButton.anchor(retweetButtonContainerView.topAnchor, left: retweetButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        likeButton.anchor(likeButtonContainerView.topAnchor, left: likeButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
        messageButton.anchor(sendButtonContainerView.topAnchor, left: sendButtonContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 20, heightConstant: 20)
    }
}
