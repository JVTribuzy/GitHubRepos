//
//  GithubReposViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class GitHubReposViewModel {
    
    lazy var realm: Realm = {
        return try! Realm()
    }()
     
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
    func getDataFromRealm() -> Results<Reporitory> {
        let results: Results<Reporitory> = realm.objects(Reporitory.self)
        return results
    }
    
    func addDataInRealm(repo: Reporitory) {
        try! realm.write {
            realm.add(repo, update: .all)
        }
    }
    
    func deleteAllFromDatabase() {
        try! realm.write {
            realm.deleteAll()
        }
    }
    
    func deleteDataFromRealm(repo: Reporitory) {
        try! realm.write {
            realm.delete(repo)
        }
    }
}
