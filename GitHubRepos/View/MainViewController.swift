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
    let repoSegmentedControl: UISegmentedControl = UISegmentedControl(items: ["All", "Saved"])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
    }
}

extension MainViewController: GitHubReposView {
    func layout() {
        view.subviews{
            repoSegmentedControl
        }
        
        // repoSegmentedControl
        repoSegmentedControl.top(8).right(16).left(16).height(30)
        repoSegmentedControl.Top == view.safeAreaLayoutGuide.Top
    }
    
    func style() {
        
        // repoSegmentedControl
        repoSegmentedControl.selectedSegmentIndex = 0
        repoSegmentedControl.layer.cornerRadius = 5.0
        repoSegmentedControl.backgroundColor = .white
        repoSegmentedControl.tintColor = .black

    }
}
