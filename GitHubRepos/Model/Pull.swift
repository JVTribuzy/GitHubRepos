//
//  Pull.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

struct Pull: Decodable{
    let htmlUrl: URL?
    let number: Int
    let state: String
    let locked: Bool
    let title: String
    let user: User
}

struct User: Decodable {
    let login: String
    let avatarUrl: URL?
}
