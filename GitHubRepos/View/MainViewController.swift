//
//  MainViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 27/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class MainViewController: UIViewController {
    
    // MARK: - Components
    let repoSegmentedControl: UISegmentedControl = UISegmentedControl(items: ["All", "Saved"])
    let reposView: UIView = UIView()
    let allReposViewController = AllReposViewController()
    let savedReposViewController = SavedReposViewController()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
    }
}

extension MainViewController: GitHubReposView {
    func layout() {
        view.subviews(
            repoSegmentedControl,
            reposView.subviews(
                allReposViewController.view,
                savedReposViewController.view
            )
        )
        
        // repoSegmentedControl
        repoSegmentedControl.Top == view.safeAreaLayoutGuide.Top
        repoSegmentedControl.top(16).right(16).left(16).height(35)
        
        // reposView
        reposView.Top == repoSegmentedControl.Bottom + 16
        reposView.right(0).left(0).bottom(0)
        
        // allReposView
        allReposViewController.view.top(0).right(0).left(0).bottom(0)
        
        // savedReposView
        savedReposViewController.view.top(0).right(0).left(0).bottom(0)
    }
    
    func style() {
        // view
        view.backgroundColor = UIColor(named: "DefaultBackground")
        
        // repoSegmentedControl
        repoSegmentedControl.selectedSegmentIndex = 0
        repoSegmentedControl.layer.cornerRadius = 5.0
        repoSegmentedControl.backgroundColor = UIColor(named: "SegmentedBackground")
        repoSegmentedControl.tintColor = UIColor(named: "Segmented")
        
        // allReposView
        allReposViewController.view.alpha = 1
        
        // savedReposView
        savedReposViewController.view.alpha = 0
    }
}
