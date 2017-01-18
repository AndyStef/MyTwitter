//
//  UserCell.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class UserCell: DatasourceCell {

    override var datasourceItem: Any? {
        didSet {
          //  nameLabel.text = datasourceItem as? String
        }
    }

    let profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "iron")
        image.layer.cornerRadius = 5

        //it's the same
        image.layer.masksToBounds = true
        image.clipsToBounds = true

        return image
    }()

    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Andriy Stefanchuk"
        label.font = UIFont.boldSystemFont(ofSize: 16)

        return label
    }()

    let usernameLabel: UILabel = {
        let label = UILabel()
        label.text = "@AndyStef"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor(r: 124, g: 124, b: 124)

        return label
    }()

    let bioTextView: UITextView = {
        let textView = UITextView()
        textView.text = "There should be very long description of me but i can't say anything about me so i'll just type out all this silly text roflanTigran, roflanBuldiga)))))))0))"
        textView.font = UIFont.systemFont(ofSize: 15)
        textView.backgroundColor = .clear

        return textView
    }()

    let followButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.cornerRadius = 6
        button.layer.masksToBounds = true
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(UIColor(r: 61, g: 167, b: 244), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderColor = UIColor(r: 61, g: 167, b: 244).cgColor
        button.layer.borderWidth = 1
        button.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        //TODO: - Maybe find better way of doing this
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -30, bottom: 0, right: 0)

        return button
    }()

    override func setupViews() {
        super.setupViews()

        addSubview(profileImageView)
        addSubview(nameLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)

        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)

        nameLabel.anchor(profileImageView.topAnchor, left: profileImageView.rightAnchor, bottom: nil, right: followButton.leftAnchor, topConstant: 0, leftConstant: 8, bottomConstant: 0, rightConstant: 12, widthConstant: 0, heightConstant: 20)
        
        usernameLabel.anchor(nameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: nil, right: nameLabel.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 20)

        bioTextView.anchor(usernameLabel.bottomAnchor, left: nameLabel.leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: -4, leftConstant: -4, bottomConstant: 8, rightConstant: 8, widthConstant: 0, heightConstant: 0)

        followButton.anchor(nameLabel.topAnchor, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 12, widthConstant: 120, heightConstant: 34)
    }
}
