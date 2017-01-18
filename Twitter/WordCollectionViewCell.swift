//
//  WordCollectionViewCell.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import UIKit

class WordCollectionViewCell: UICollectionViewCell {

    let wordLabel: UILabel = {
        let label = UILabel()
        label.text = "Test label"
        label.translatesAutoresizingMaskIntoConstraints = false

        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }

    fileprivate func setupViews() {
        backgroundColor = .yellow
        addSubview(wordLabel)
        wordLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        wordLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        wordLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        wordLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
