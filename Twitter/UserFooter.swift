//
//  UserFooter.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class UserFooter: DatasourceCell {

    let textLabel: UILabel = {
        let label = UILabel()
        label.text = "Show me more"
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = UIColor(r: 61, g: 167, b: 244)

        return label
    }()

    override func setupViews() {
        super.setupViews()

        let whiteBackgroundView = UIView()
        whiteBackgroundView.backgroundColor = .white

        addSubview(whiteBackgroundView)
        whiteBackgroundView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)

        addSubview(textLabel)
        textLabel.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 14, bottomConstant: 14, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
}
