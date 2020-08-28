//
//  ReposCollectionViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class ReposCollectionViewController: UICollectionViewController {
    
    private let viewModel = GitHubReposViewModel()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        layout()
        style()
    }
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
        setupCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

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
        layout.itemSize = CGSize(width: view.frame.size.width - 16, height: 100)
        
        collectionView.collectionViewLayout = layout
    }
    
    private func setupCollectionViewCell(){
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return viewModel.reposCount != nil ? viewModel.reposCount! : 0
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
}

