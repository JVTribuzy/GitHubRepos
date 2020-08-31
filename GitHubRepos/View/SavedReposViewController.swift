//
//  SavedReposViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class SavedReposViewController: UIViewController {
    
    public private(set) var savedReposCollectionViewController = ReposCollectionViewController(type: .saved)
    private let noReposLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupNotifications()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension SavedReposViewController: GitHubReposView{
    func layout() {
        view.subviews(
            savedReposCollectionViewController.view,
            noReposLabel
        )
        
        // savedReposCollectionView
        savedReposCollectionViewController.view.top(0).right(0).left(0).bottom(0)
        
        // noReposLabel
        noReposLabel.centerInContainer()
    }
    
    func style() {
        // savedReposCollectionView
        savedReposCollectionViewController.collectionView.isHidden = true
        
        // noReposLabel
        noReposLabel.text = "No repositories! T-T"
        noReposLabel.font = UIFont.systemFont(ofSize: 20)
    }
}

extension SavedReposViewController{
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSavedReposCollectionViewNotificationReceived(_:)), name: .reloadSavedReposCollectionView, object: nil)
    }
    
    @objc private func reloadSavedReposCollectionViewNotificationReceived(_ notification: Notification){
        DispatchQueue.main.async {
            self.savedReposCollectionViewController.collectionView.reloadData()
        }
        switchEmptyCollectionView()
    }
    
    private func switchEmptyCollectionView(){
        savedReposCollectionViewController.collectionView.isHidden = false
        noReposLabel.isHidden = true
    }
}
