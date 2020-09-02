//
//  ReposCollectionViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

enum RepoListType{
    case all
    case saved
}

class ReposCollectionViewController: UICollectionViewController {
    
    // MARK: - Lifecycle
    init() {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        setupCollectionView()
        
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Style and Layout
extension ReposCollectionViewController: GitHubReposView {
    func layout() {
        // view
        view.top(0).right(0).left(0).bottom(0)
        
        // collectionView
        collectionView.top(0).right(0).left(0).bottom(0)
    }
    
    func style() {
        collectionView.backgroundColor = UIColor(named: "DefaultBackground")
    }
}

// MARK: - CollectionView funcionality
extension ReposCollectionViewController {
    private func setupCollectionView(){
        setupCollectionViewFlowLayout()
        setupCollectionViewCell()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupCollectionViewFlowLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.size.width - 16, height: 130)
        
        collectionView.collectionViewLayout = layout
    }
    
    private func setupCollectionViewCell(){
        collectionView.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}
