//
//  Service.swift
//  Twitter
//
//  Created by Andy Stef on 2/9/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import Foundation
import TRON
import SwiftyJSON

class Service {

    static let sharedInstance = Service()

    let tron = TRON(baseURL: "https://api.letsbuildthatapp.com")

    class Home: JSONDecodable {
        let users: [User]

        required init(json: JSON) throws {
            var users = [User]()

            let array = json["users"].array

            for user in array! {
                let name = user["name"].stringValue
                let username = user["username"].stringValue
                let bio = user["bio"].stringValue

                let user = User(name: name, username: username, bioText: bio, profileImage: #imageLiteral(resourceName: "iron"))
                users.append(user)
            }

            self.users = users
        }
    }

    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("error:", json)
        }
    }

    func fetchHomeFeed(completion: @escaping (HomeDatasource) -> ()) {
        let request: APIRequest<HomeDatasource, JSONError> = tron.request("twitter/home")
        
        request.perform(withSuccess: { (homeDatasource) in
            completion(homeDatasource)
        }, failure: { (error) in
            print("Failed", error)
        })
    }
}
