//
//  HomeDatasource.swift
//  Twitter
//
//  Created by Andy Stef on 1/18/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import LBTAComponents

class HomeDatasource: Datasource {

    let users: [User] = {
        let firstUser = User(name: "Andriy Stefanchuk", username: "@AndyStef", bioText: "There should be very long description of me but i can't say anything about me so i'll just type out all this silly text roflanTigran, roflanBuldiga)))))))0))", profileImage: #imageLiteral(resourceName: "iron"))
        let secondUser = User(name: "second user", username: "@fsafsafasf", bioText: "fsaffasfasfasfsaf  fasfasfasfasfasfasfasfsa asfsafasfasfasfasfasfasfasas", profileImage: #imageLiteral(resourceName: "iron"))

        return [firstUser, secondUser]
    }()

    let tweets: [Tweet] = {
        let firstUser = User(name: "Andriy Stefanchuk", username: "@AndyStef", bioText: "There should be very long description of me but i can't say anything about me so i'll just type out all this silly text roflanTigran, roflanBuldiga)))))))0))", profileImage: #imageLiteral(resourceName: "iron"))
        let tweet = Tweet(user: firstUser, message: "Welcome to the episode number 9 of twitter tutorial series. And also i need very long message right here so i won't just stop here and will keep on typing kappa)")
        let tweet2 = Tweet(user: firstUser, message: "Here we go again!!!!fsafasf_))fsa")

        return [tweet, tweet2]
    }()

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
