//
//  TweetCell.swift
//  Twitter
//
//  Created by Andy Stef on 1/19/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class TweetCell: DatasourceCell {

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
        profileImageView.anchor(topAnchor, left: leftAnchor, bottom: nil, right: nil, topConstant: 12, leftConstant: 12, bottomConstant: 0, rightConstant: 0, widthConstant: 50, heightConstant: 50)
    }
}
