//
//  Repository.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import RealmSwift

class Reporitory : Object, Decodable{
    @objc dynamic var ID = ""
    dynamic var identifier: Int
    dynamic var name: String
    dynamic var `private`: Bool
    dynamic var owner: Owner
    dynamic var htmlUrl: String?
    dynamic var repoDescription: String
    dynamic var pullsUrl: String?
    dynamic var stargazersCount: Int
    dynamic var language: String?
    dynamic var forks: Int
    dynamic var openIssues: Int
    dynamic var watchers: Int
    
    enum CodingKeys: String, CodingKey {
        case repoDescription = "description"
        case identifier = "id"
        case name, `private`, owner, htmlUrl, pullsUrl, stargazersCount, language, forks, openIssues, watchers
    }
    
    override static func primaryKey() -> String? {
        return "ID"
    }
}
