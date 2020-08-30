//
//  PullsCollectionViewController.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit

class PullsCollectionViewController: UICollectionViewController {
    
    private var repository: Reporitory
    
    private var viewModel: PullsViewModel? = nil
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        layout()
        style()
    }
    
    init(repository: Reporitory) {
        self.repository = repository
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        
        initPullViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PullsCollectionViewController {
    func initPullViewModel() {
        viewModel = PullsViewModel(owner: repository.owner.login, repoName: repository.name)
//        print(viewModel)
//        print("---------------------------------------")
    }
}

extension PullsCollectionViewController: GitHubReposView {
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

extension PullsCollectionViewController {
    private func setupCollectionView(){
        setupCollectionViewFlowLayout()
        setupCollectionViewCell()
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    private func setupCollectionViewFlowLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: view.frame.size.width - 16, height: 160)
        
        collectionView.collectionViewLayout = layout
    }
    
    private func setupCollectionViewCell(){
        collectionView.register(PullCollectionViewCell.self, forCellWithReuseIdentifier: "pullCell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel?.pullsCount != nil ? viewModel?.pullsCount : 0)!
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pullCell", for: indexPath) as! PullCollectionViewCell
        cell.fill(with: viewModel?.allPulls?[indexPath.row])
        return cell
    }
}
