//
//  GithubResult.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

struct GithubResult: Decodable {
    let totalCount: Int
    let incompleteResults: Bool
    let items: [Repository]
}
