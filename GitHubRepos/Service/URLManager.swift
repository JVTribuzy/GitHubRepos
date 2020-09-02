//
//  URLManager.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class URLManager {
    /// The URL of repositories from the API sorted by stars.
    public static let allReposURL = URL(string: "http://api.github.com/search/repositories?q=language:Swift&sort=stars")
    
    /// The primary URL used to make Pull Request List URL.
    public static let pullURL = URL(string: "http://api.github.com/repos")
    
    /// Return the URL for pull request list according to the user
    /// - Parameters:
    ///   - owner: The Github name of th user.
    ///   - from: The repository name.
    public func makePullURL(with owner: String, from repo: String) -> URL? {
        var url = URLManager.pullURL
        url?.appendPathComponent(owner)
        url?.appendPathComponent(repo)
        url?.appendPathComponent("pulls")
        return url
    }
}

