//
//  Owner.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import RealmSwift

class Owner: Object, Decodable{
    @objc dynamic var login: String = ""
    @objc dynamic var avatarUrl: String? = nil
    @objc dynamic var htmlUrl: String? = nil
}
