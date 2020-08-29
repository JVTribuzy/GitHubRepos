//
//  RepoDetailViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 29/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class RepoDetailViewController: UIViewController {
    // MARK: - Components
    
    private let titleLabel = UILabel()
    private let closeButton = UIButton()
    
    private var repository: Reporitory? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupCloseButton()
    }
}

extension RepoDetailViewController{
    private func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
    }
    
    @objc private func closeDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
}
extension RepoDetailViewController{
    public func fill(_ repository: Reporitory?) {
        self.repository = repository
        guard repository != nil else { return }
        
        titleLabel.text = self.repository?.name
    }
}

extension RepoDetailViewController: GitHubReposView{
    func layout() {
        view.subviews(
            closeButton,
            titleLabel
        )
        
        // closeButton
        closeButton.top(16).right(16).height(40).width(40)
        
        // titleLabel
        titleLabel.top(50).right(16).left(16)
    }
    
    func style() {
        // view
        view.backgroundColor = UIColor(named: "DefaultBackground")
        
        // closeButton
        closeButton.setImage(UIImage(systemName: "xmark.circle.fill"), for: .normal)
        closeButton.imageView?.contentMode = .scaleAspectFill
        closeButton.tintColor = .lightGray
        
        // titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.numberOfLines = 0
    }
}
