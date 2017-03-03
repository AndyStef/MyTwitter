//
//  Collection.swift
//  Twitter
//
//  Created by Stef on 3/3/17.
//  Copyright © 2017 Andy Stef. All rights reserved.
//

import Foundation
import SwiftyJSON
import TRON

extension Collection where Iterator.Element == JSON  {
    func decode<T: JSONDecodable>() throws -> [T] {
        return try map{try T(json: $0)}
    }
}
