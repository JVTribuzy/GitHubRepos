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
    
    public private(set) var allReposCollectionViewController = ReposCollectionViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
    }
}

extension AllReposViewController: GitHubReposView{
    func layout() {
        view.subviews(
            allReposCollectionViewController.view
        )
        
        // allReposCollectionView
        allReposCollectionViewController.view.top(0).right(0).left(0).bottom(0)
    }
    
    func style() {}
}
