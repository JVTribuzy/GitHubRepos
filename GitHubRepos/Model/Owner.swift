//
//  Owner.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

struct Owner: Decodable{
    let login: String
    let avatarUrl: URL?
    let htmlUrl: URL?
}
