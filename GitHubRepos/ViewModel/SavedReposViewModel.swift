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
    let realm = try! Realm()
        
    public private(set) var savedRepos: [Reporitory] = [] {
        didSet {
            savedReposCount = savedRepos.count
            DispatchQueue.main.async {
                NotificationCenter.default.post(name: .reloadSavedReposCollectionView, object: nil)
            }
        }
    }
        
    public private(set) var savedReposCount: Int? = nil
    
    init() {
        fetchAllLocally()
    }
}

extension SavedReposViewModel {
    func saveLocally(_ repo: Reporitory) {
        fetchAllLocally()
        guard savedReposContain(repo) == false else { return }
        realm.beginWrite()
        realm.add(repo)
        try! realm.commitWrite()
        fetchAllLocally()
    }
    
    func fetchAllLocally() {
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
