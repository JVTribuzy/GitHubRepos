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
    
    public private(set) var allReposCollectionViewController = AllReposCollectionViewController()
    private let noReposLabel = UILabel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupNotifications()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        allReposCollectionViewController.collectionView.reloadData()
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
        allReposCollectionViewController.view.isHidden = true
        
        // noReposLabel
        noReposLabel.text = "No repositories! T-T"
        noReposLabel.font = UIFont.systemFont(ofSize: 20)
        noReposLabel.isHidden = false
    }
}

extension AllReposViewController{
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(switchEmptyCollectionView), name: .switchingVisibilityOfAllReposViewController, object: nil)
    }
    
    @objc private func switchEmptyCollectionView(){
        if allReposCollectionViewController.collectionView.numberOfItems(inSection: 0) == 0 {
            allReposCollectionViewController.view.isHidden = true
            noReposLabel.isHidden = false
        } else {
            allReposCollectionViewController.view.isHidden = false
            noReposLabel.isHidden = true
        }
    }
}
