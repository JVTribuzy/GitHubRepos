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
        repoSegmentedControl.top(16).right(16).left(16).height(35)
        repoSegmentedControl.Top == view.safeAreaLayoutGuide.Top
    }
    
    func style() {
        // view
        view.backgroundColor = UIColor(named: "DefaultBackground")
        
        // repoSegmentedControl
        repoSegmentedControl.selectedSegmentIndex = 0
        repoSegmentedControl.layer.cornerRadius = 5.0
        repoSegmentedControl.backgroundColor = UIColor(named: "SegmentedBackground")
        repoSegmentedControl.tintColor = UIColor(named: "Segmented")
    }
}
