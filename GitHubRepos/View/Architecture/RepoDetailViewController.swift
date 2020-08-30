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
    
    private var viewModel: PullsViewModel? = nil
    
    // MARK: - Components
    
    private let titleLabel = UILabel()
    
    private let closeButton = UIButton()
    private let saveButton = UIButton()
    
    private let descriptionLabel = UILabel()
    
    private var repository: Reporitory? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupCloseButton()
    }
    
    init(repository: Reporitory?){
        super.init(nibName: nil, bundle: nil)
        
        fill(repository)
        
        initPullViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepoDetailViewController {
    func initPullViewModel() {
        guard repository != nil else { return }
        viewModel = PullsViewModel(owner: repository!.owner.login, repoName: repository!.name)
        print(viewModel)
        print("---------------------------------------")
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
        descriptionLabel.text = self.repository?.description
    }
}

extension RepoDetailViewController: GitHubReposView{
    func layout() {
        view.subviews(
            closeButton,
            saveButton,
            titleLabel,
            descriptionLabel
        )
        
        // closeButton
        closeButton.top(10).left(10).height(40).width(40)
        
        // saveButton
        saveButton.top(10).right(16).height(40)
        
        // titleLabel
        titleLabel.top(50).right(16).left(16)
        
        // descriptionLabel
        descriptionLabel.Top == titleLabel.Bottom + 16
        descriptionLabel.right(16).left(16)
    }
    
    func style() {
        // view
        view.backgroundColor = UIColor(named: "DefaultBackground")
        
        // closeButton
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.imageView?.contentMode = .scaleAspectFill
        closeButton.tintColor = .lightGray
        
        // saveButton
        saveButton.setTitle(NSLocalizedString("Save", comment: ""), for: .normal)
        saveButton.setTitleColor(.systemBlue, for: .normal)
        saveButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        // titleLabel
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30.0)
        titleLabel.numberOfLines = 0
        
        // descriptionLabel
        descriptionLabel.numberOfLines = 0
        descriptionLabel.font = UIFont.systemFont(ofSize: 16)
    }
}
