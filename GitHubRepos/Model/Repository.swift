//
//  Repository.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import RealmSwift

class Repository: Object, Decodable{
    @objc dynamic var identifier: Int = 0
    @objc dynamic var name: String = ""
    @objc dynamic var `private`: Bool = false
    @objc dynamic var owner: Owner? =  nil
    @objc dynamic var htmlUrl: String = ""
    @objc dynamic var repoDescription: String = ""
    @objc dynamic var pullsUrl: String = ""
    @objc dynamic var stargazersCount: Int = 0
    @objc dynamic var language: String = ""
    @objc dynamic var forks: Int = 0
    @objc dynamic var openIssues: Int = 0
    @objc dynamic var watchers: Int = 0
    
    enum CodingKeys: String, CodingKey {
        case repoDescription = "description"
        case identifier = "id"
        case name, `private`, owner, htmlUrl, pullsUrl, stargazersCount, language, forks, openIssues, watchers
    }
    
    override class func primaryKey() -> String? {
        return "identifier"
    }
}
