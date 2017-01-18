//
//  UserHeader.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class UserHeader: DatasourceCell {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "WHO TO FOLLOW"
        label.font = UIFont.systemFont(ofSize: 16)

        return label
    }()

    override func setupViews() {
        super.setupViews()

        separatorLineView.isHidden = false
        backgroundColor = .white

        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 14, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
