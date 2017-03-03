//
//  Tweet.swift
//  Twitter
//
//  Created by Andy Stef on 1/26/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

struct Tweet: JSONDecodable {
    let user: User
    let message: String

    init(json: JSON) {
        let userJson = json["user"]
        self.user = User(json: userJson)
        self.message = json["message"].stringValue
    }
}
