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
    
    private let viewModel = GitHubReposViewModel()
    
    private var reposListType: RepoListType?
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        
        layout()
        style()
    }
    
    init(type: RepoListType) {
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
        reposListType = type
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
        layout.itemSize = CGSize(width: view.frame.size.width - 16, height: 130)
        
        collectionView.collectionViewLayout = layout
    }
    
    private func setupCollectionViewCell(){
        collectionView.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch reposListType {
        case .all: return viewModel.reposCount != nil ? viewModel.reposCount! : 0
        case .saved: return 0
        default: return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! RepoCollectionViewCell
        cell.fill(with: viewModel.allRepos?[indexPath.row])
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailViewController = RepoDetailViewController()
        detailViewController.fill(viewModel.allRepos?[indexPath.row])
        self.present(detailViewController, animated: true, completion: nil)
    }
}
