//
//  PullsViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

class PullsViewModel {
    private let owner: String
    private let repositoryName: String
    
    public private(set) var allPulls: [Pull]? = nil {
        didSet{
            if allPulls != nil {
                pullsCount = allPulls?.count
//                DispatchQueue.main.async {
//                    NotificationCenter.default.post(name: .reloadAllReposCollectionView, object: nil)
//                }
            }
        }
    }
    
    public private(set) var pullsCount: Int? = nil

    init(owner: String, repoName: String) {
        self.owner = owner
        self.repositoryName = repoName
        
        fetchAllPulls()
    }
    
    func fetchAllPulls() {
        PullAPI().fetch(owner: owner, repositoryName: repositoryName) { [weak self] pulls in
            // TODO: Remove print pulls
            print(pulls)
            self?.allPulls = pulls
        }
    }
}
