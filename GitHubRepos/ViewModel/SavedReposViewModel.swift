//
//  SavedReposViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 01/09/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import Realm
import RealmSwift

class SavedReposViewModel {
    
    static var shared: SavedReposViewModel = {
        return SavedReposViewModel()
    }()
    
    var realm = try! Realm()
        
    public private(set) var savedRepos: [Repository] = [] {
        didSet {
            savedReposCount = savedRepos.count
            NotificationCenter.default.post(name: .reloadSavedReposCollectionView, object: nil)
        }
    }
        
    public private(set) var savedReposCount: Int? = nil
    
    init() {
//        deleteAllRepos()
        fetchAllLocally()
    }
}

extension SavedReposViewModel {
    func saveLocally(_ repo: Repository) {
        guard savedReposContain(repo) == false else { return }
        fetchAllLocally()
        realm.beginWrite()
        realm.create(Repository.self, value: repo, update: .all)
        try! realm.commitWrite()
        fetchAllLocally()
    }
    
    func fetchAllLocally() {
        let repositories = realm.objects(Repository.self)
        savedRepos = Array(repositories).sorted { $0.name < $1.name }
    }
    
    func savedReposContain(_ repository: Repository) -> Bool {
        return (filterRepos(repo: repository)).isEmpty ? false : true
    }
    
    func filterRepos(repo: Repository) -> [Repository]{
        return savedRepos.filter { $0.identifier == repo.identifier }
    }
    
    func removeLocally(_ repo: Repository) {
        if savedReposContain(repo) {
            let alphabeticalResult = Array(realm.objects(Repository.self)).sortAlphabetically()
            for (index, repository) in alphabeticalResult.enumerated(){
                if repository.identifier == repo.identifier {
                    savedRepos.remove(at: index)
                    try! realm.write {
                        realm.delete(repository)
                    }
                }
            }
        }
    }
    
    func deleteAllRepos(){
        realm.beginWrite()
        realm.deleteAll()
        try! realm.commitWrite()
    }
}
