//
//  Repository.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

struct Reporitory : Decodable{
    let id: Int
    let name: String
    let `private`: Bool
    let owner: Owner
    let htmlUrl: String?
    let description: String?
    let pullsUrl: String?
    let stargazersCount: Int
    let language: String?
    let forks: Int
    let openIssues: Int
    let watchers: Int
}
