//
//  SavedReposCollectionViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 01/09/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class SavedReposCollectionViewController: ReposCollectionViewController {
    
    // MARK: - ViewModel
    private var viewModel = SavedReposViewModel.shared
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        setupNotifications()
        reloadSavedReposCollectionViewNotificationReceived()
    }
}

// MARK: - CollectionView funcionality
extension SavedReposCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.savedReposCount != nil ? viewModel.savedReposCount! : 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RepoCollectionViewCell
        cell.fill(with: viewModel.savedRepos[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let repository = viewModel.savedRepos[indexPath.row]
        let detailViewController = RepoDetailViewController(repository: repository)
        self.present(detailViewController, animated: true, completion: nil)
    }
}

// MARK: - Notification
extension SavedReposCollectionViewController {
    private func setupNotifications(){
        NotificationCenter.default.addObserver(self, selector: #selector(reloadSavedReposCollectionViewNotificationReceived), name: .reloadSavedReposCollectionView, object: nil)
    }
    
    @objc private func reloadSavedReposCollectionViewNotificationReceived(){
        DispatchQueue.main.async {
            self.collectionView.reloadData()
            NotificationCenter.default.post(name: .switchingVisibilityOfSavedReposViewController, object: nil)
        }
    }
}
