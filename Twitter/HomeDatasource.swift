//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents
import TRON
import SwiftyJSON

class HomeDatasource: Datasource, JSONDecodable {

    let users: [User]
    let tweets: [Tweet]

    required init(json: JSON) throws {
        guard let userJsonArray = json["users"].array,
                let tweetsJsonArray = json["tweets"].array else {
            throw NSError(domain: "com.AndyStef", code: 251, userInfo: [NSLocalizedDescriptionKey: "Parsing JSON was not valid"])
        }

        self.users = userJsonArray.map{User(json: $0)}
        self.tweets = tweetsJsonArray.map{Tweet(json: $0)}
    }

    override func numberOfItems(_ section: Int) -> Int {
        if section == 1 {
            return tweets.count
        }

        return users.count
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        if indexPath.section == 1 {
            return tweets[indexPath.row]
        }

        return users[indexPath.item]
    }

    override func numberOfSections() -> Int {
        return 2
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self, TweetCell.self]
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
