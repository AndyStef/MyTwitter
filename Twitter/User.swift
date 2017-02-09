//
//  User.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import UIKit
import SwiftyJSON

struct User {
    let name: String
    let username: String
    let bioText: String
    let profileImage: UIImage

    init(json: JSON) {
        self.name = json["name"].stringValue
        self.username = json["username"].stringValue
        self.bioText = json["bio"].stringValue
        self.profileImage = #imageLiteral(resourceName: "iron")
    }
}
