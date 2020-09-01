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
    
    private let allReposViewModel = GitHubReposViewModel()
    private let savedReposViewModel = SavedReposViewModel()
    
    // MARK: - Components
    
    private let titleLabel = UILabel()
    
    private let closeButton = UIButton()
    private let saveButton = UIButton()
    private let removeButton = UIButton()
    
    private let descriptionLabel = UILabel()
    
    private var pullsCollectionViewController: PullsCollectionViewController
    
    private var repository: Reporitory? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
        
        setupCloseButton()
        
        setupNotifications()
    }
    
    init(repository: Reporitory){
        pullsCollectionViewController = PullsCollectionViewController(repository: repository)
        super.init(nibName: nil, bundle: nil)
        
        fill(repository)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}

extension RepoDetailViewController {
    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(reloadPullNotificationReceived(_:)), name: .reloadPullCollectionViewController, object: nil)
    }
    
    @objc private func reloadPullNotificationReceived(_ notification: Notification) {
        self.pullsCollectionViewController.collectionView.reloadData()
    }
}

extension RepoDetailViewController{
    private func setupCloseButton() {
        closeButton.addTarget(self, action: #selector(closeDetailView), for: .touchUpInside)
        saveButton.addTarget(self, action: #selector(save), for: .touchUpInside)
    }
    
    @objc private func closeDetailView() {
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc private func save() {
        guard repository != nil else { return }
        savedReposViewModel.saveLocally(repository!)
        setSaveAndRemoveButtonVisibility()
    }
}

extension RepoDetailViewController{
    public func fill(_ repository: Reporitory?) {
        self.repository = repository
        guard repository != nil else { return }
        
        titleLabel.text = self.repository?.name
        descriptionLabel.text = self.repository?.repoDescription
    }
}

extension RepoDetailViewController: GitHubReposView{
    func layout() {
        view.subviews(
            closeButton,
            removeButton,
            saveButton,
            titleLabel,
            descriptionLabel,
            pullsCollectionViewController.view
        )
        
        // closeButton
        closeButton.top(10).left(10).height(40).width(40)
        
        // saveButton
        saveButton.top(10).right(16).height(40)
        
        // removeButton
        removeButton.top(10).right(16).height(40)
        
        setSaveAndRemoveButtonVisibility()
        
        // titleLabel
        titleLabel.top(50).right(16).left(16)
        
        // descriptionLabel
        descriptionLabel.Top == titleLabel.Bottom + 16
        descriptionLabel.right(16).left(16)
        
        // pullsCollectionViewController
        pullsCollectionViewController.view.Top == descriptionLabel.Bottom + 8
        pullsCollectionViewController.view.right(0).left(0).bottom(0)
    }
    
    func style() {
        // view
        view.backgroundColor = UIColor(named: "DefaultBackground")
        
        // closeButton
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.imageView?.contentMode = .scaleAspectFill
        closeButton.tintColor = .lightGray
        
        // removeButton
        removeButton.setTitle(NSLocalizedString("Remove", comment: ""), for: .normal)
        removeButton.setTitleColor(.systemRed, for: .normal)
        removeButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        
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
    
    private func setSaveAndRemoveButtonVisibility() {
        guard repository != nil else { return }
        if savedReposViewModel.savedReposContain(self.repository!) {
            UIView.animate(withDuration: 0.1) {
                self.removeButton.alpha = 1
                self.saveButton.alpha = 0
            }
        } else {
            UIView.animate(withDuration: 0.1) {
                self.removeButton.alpha = 0
                self.saveButton.alpha = 1
            }
        }
    }
}
