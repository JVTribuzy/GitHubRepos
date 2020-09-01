//
//  Notification+Extensions.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 29/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import Foundation

extension Notification.Name {
    public static let reloadAllReposCollectionView = Notification.Name("com.tribuzy.GitHubRepos.notification.reloadAllReposCollectionView")
    public static let switchingVisibilityOfAllReposViewController = Notification.Name("com.tribuzy.GitHubRepos.notification.switchingVisibilityOfAllReposViewController")
    public static let reloadSavedReposCollectionView = Notification.Name("com.tribuzy.GitHubRepos.notification.reloadSavedReposCollectionView")
     public static let switchingVisibilityOfSavedReposViewController = Notification.Name("com.tribuzy.GitHubRepos.notification.switchingVisibilityOfSavedReposViewController")
    public static let reloadPullCollectionViewController = Notification.Name("com.tribuzy.GitHubRepos.notification.reloadPullCollectionViewController")
}
