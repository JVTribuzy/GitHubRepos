//
//  AllReposViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class AllReposViewController: UIViewController {
    
    public private(set) var allReposCollectionViewController = ReposCollectionViewController(type: .all)
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

extension AllReposViewController: GitHubReposView{
    func layout() {
        view.subviews(
            allReposCollectionViewController.view,
            noReposLabel
        )
        
        // allReposCollectionView
        allReposCollectionViewController.view.top(0).right(0).left(0).bottom(0)
        
        // noReposLabel
        noReposLabel.centerInContainer()
    }
    
    func style() {
        // allReposCollectionView
        allReposCollectionViewController.collectionView.isHidden = true
        
        // noReposLabel
        noReposLabel.text = "No repositories! T-T"
        noReposLabel.font = UIFont.systemFont(ofSize: 20)
    }
}

extension AllReposViewController{
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAllReposCollectionViewNotificationReceived(_:)), name: .reloadAllReposCollectionView, object: nil)
    }
    
    @objc private func reloadAllReposCollectionViewNotificationReceived(_ notification: Notification){
        DispatchQueue.main.async {
            self.allReposCollectionViewController.collectionView.reloadData()
        }
        switchEmptyCollectionView()
    }
    
    private func switchEmptyCollectionView(){
        allReposCollectionViewController.collectionView.isHidden = false
        noReposLabel.isHidden = true
    }
}
