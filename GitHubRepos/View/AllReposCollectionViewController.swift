//
//  AllReposCollectionViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 01/09/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class AllReposCollectionViewController: ReposCollectionViewController {
    
    private let viewModel = GitHubReposViewModel()
    
    override func viewDidLoad() {
        setupNotifications()
    }
}

extension AllReposCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.reposCount != nil ? viewModel.reposCount! : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RepoCollectionViewCell
        cell.fill(with: viewModel.allRepos?[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let repository = viewModel.allRepos?[indexPath.row] else { return }
        let detailViewController = RepoDetailViewController(repository: repository)
        self.present(detailViewController, animated: true, completion: nil)
    }
}

extension AllReposCollectionViewController {
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadAllReposCollectionViewNotificationReceived), name: .reloadAllReposCollectionView, object: nil)
    }
    
    @objc private func reloadAllReposCollectionViewNotificationReceived(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            NotificationCenter.default.post(name: .switchingVisibilityOfAllReposViewController, object: nil)
        }
    }
}
