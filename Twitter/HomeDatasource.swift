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

    override func numberOfItems(_ section: Int) -> Int {
        return users.count
    }

    override func item(_ indexPath: IndexPath) -> Any? {
        return users[indexPath.item]
    }

    override func cellClasses() -> [DatasourceCell.Type] {
        return [UserCell.self]
    }

    override func headerClasses() -> [DatasourceCell.Type]? {
        return [UserHeader.self]
    }

    override func footerClasses() -> [DatasourceCell.Type]? {
        return [UserFooter.self]
    }
}
