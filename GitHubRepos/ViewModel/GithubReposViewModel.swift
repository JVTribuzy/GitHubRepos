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
    
    public private(set) var savedRepos: [Reporitory] = [] {
        didSet {
            savedReposCount = savedRepos.count
            DispatchQueue.main.async {
//                NotificationCenter.default.post(name: .reloadSavedReposCollectionView, object: nil)
            }
        }
    }
    
    public private(set) var savedReposCount: Int? = nil
     
    public private(set) var githubAPIResult: GithubResult? = nil {
        didSet { allRepos = githubAPIResult?.items }
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
        fetchLocally()
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
        fetchLocally()
        guard savedReposContain(repo) == false else { return }
        realm.beginWrite()
        realm.add(repo)
        try! realm.commitWrite()
        fetchLocally()
    }
    
    func fetchLocally() {
        let repositories = realm.objects(Reporitory.self)
        savedRepos = Array(repositories)
    }
    
    func savedReposContain(_ repository: Reporitory) -> Bool {
        return (savedRepos.filter { $0.identifier == repository.identifier }).isEmpty ? false : true
    }
    
    func deleteAllRepos(){
        realm.beginWrite()
        realm.deleteAll()
        try! realm.commitWrite()
    }
}
