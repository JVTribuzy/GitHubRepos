//
//  GithubReposViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import RealmSwift

class GitHubReposViewModel {
    
    let realm = try! Realm()
     
    public private(set) var githubAPIResult: GithubResult? = nil {
        didSet {
            allRepos = githubAPIResult?.items
        }
    }
    
    public private(set) var allRepos: [Reporitory]? = nil {
        didSet{
            if allRepos != nil {
                reposCount = allRepos?.count
                DispatchQueue.main.async {
                    NotificationCenter.default.post(name: .reloadAllReposCollectionView, object: nil)
                }
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
//            print(result)
            self?.githubAPIResult = result
        }
    }
}

extension GitHubReposViewModel {
    func saveLocally(_ repo: Reporitory) {
        let repositoy = repo
        realm.beginWrite()
        realm.add(repositoy)
        try! realm.commitWrite()
        fetchLocally()
    }
    
    func fetchLocally() {
        let repositories = try! realm.objects(Reporitory.self)
        for repository in repositories {
            print(repository.name)
        }
    }
}
