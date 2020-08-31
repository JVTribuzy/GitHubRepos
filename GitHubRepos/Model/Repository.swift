//
//  Repository.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class Reporitory : Object, Decodable{
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
    
    dynamic var id = UUID().uuidString
}

extension Reporitory {
    static func getAllRepos(in realm: Realm = try! Realm()) -> Results<Reporitory> {
      return realm.objects(Reporitory.self)
    }
    
    @discardableResult
    static func add(repo: Reporitory, in realm: Realm = try! Realm()) -> Reporitory {
        try! realm.write {
          realm.add(repo)
        }
        return repo
    }

    func delete() {
        guard let realm = realm else { return }
        try! realm.write {
            realm.delete(self)
        }
    }
}
