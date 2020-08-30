//
//  URLManager.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class URLManager {
    public static let allReposURL = URL(string: "http://api.github.com/search/repositories?q=language:Swift&sort=stars")
    public static let pullURL = URL(string: "http://api.github.com/repos")
    
    public func makePullURL(with owner: String, from repo: String) -> URL? {
        var url = URLManager.pullURL
        url?.appendPathComponent(owner)
        url?.appendPathComponent(repo)
        url?.appendPathComponent("pulls")
        return url
    }
}

