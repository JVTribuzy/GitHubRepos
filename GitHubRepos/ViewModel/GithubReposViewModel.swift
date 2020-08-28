//
//  GithubReposViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class GitHubReposViewModel {
    
    public private(set) var githubAPIResult: GithubResult? = nil {
        didSet {
            allRepos = githubAPIResult?.items
        }
    }
    
    public private(set) var allRepos: [Reporitory]? = nil {
        didSet{
            if allRepos != nil {
                reposCount = allRepos?.count
            }
        }
    }
    
    public private(set) var reposCount: Int? = nil

    init() {
        fetchAllRepos()
    }
    
    func fetchAllRepos() {
        GithubResultAPI().fetch { [weak self] result in
            // TODO: Remove print result
            print(result)
            self?.githubAPIResult = result
        }
    }
}
