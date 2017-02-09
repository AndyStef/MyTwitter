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
