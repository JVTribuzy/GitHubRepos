//
//  SavedReposViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class SavedReposViewController: UIViewController {
    
    // MARK: - Components
    public private(set) var savedReposCollectionViewController = SavedReposCollectionViewController()
    private let noReposLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupNotifications()
    }
    
    deinit { NotificationCenter.default.removeObserver(self) }
}

// MARK: - Style and Layout
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
        savedReposCollectionViewController.view.isHidden = true
        
        // noReposLabel
        noReposLabel.text = "No repositories! T-T"
        noReposLabel.font = UIFont.systemFont(ofSize: 20)
        noReposLabel.isHidden = false
    }
}

// MARK: - Notification
extension SavedReposViewController{
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(switchEmptyCollectionView(_:)), name: .switchingVisibilityOfSavedReposViewController, object: nil)
    }
    
    @objc private func switchEmptyCollectionView(_ notification: Notification){
        if savedReposCollectionViewController.collectionView.numberOfItems(inSection: 0) == 0 {
            savedReposCollectionViewController.view.isHidden = true
            noReposLabel.isHidden = false
        } else {
            savedReposCollectionViewController.view.isHidden = false
            noReposLabel.isHidden = true
        }
    }
}
