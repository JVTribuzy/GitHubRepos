//
//  SavedReposViewModel.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 01/09/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation
import RealmSwift

class SavedReposViewModel {
    
    static var shared: SavedReposViewModel = {
        return SavedReposViewModel()
    }()
    
    let realm = try! Realm()
        
    public private(set) var savedRepos: [Reporitory] = [] {
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
    func saveLocally(_ repo: Reporitory) {
        guard savedReposContain(repo) == false else { return }
        realm.beginWrite()
        realm.add(repo)
        try! realm.commitWrite()
        fetchAllLocally()
    }
    
    func fetchAllLocally() {
        let repositories = realm.objects(Reporitory.self)
        savedRepos = Array(repositories).sorted { $0.name < $1.name }
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
