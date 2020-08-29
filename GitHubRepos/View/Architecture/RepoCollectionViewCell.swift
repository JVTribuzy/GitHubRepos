//
//  RepoCollectionViewCell.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 28/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//

import UIKit
import Stevia

class RepoCollectionViewCell: UICollectionViewCell {
    
    private var repository: Reporitory? = nil
    
    // MARK: - Components
    private let repoNameLabel: UILabel = UILabel()
    private let descriptionLabel: UILabel = UILabel()
    
    private let starImage = UIImageView(image: UIImage(systemName: "star.fill"))
    private let starredQuantityLabel: UILabel = UILabel()
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        layout()
        style()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RepoCollectionViewCell {
    public func fill(with repo: Reporitory?) {
        self.repository = repo
        
        guard repository != nil else { return }
        
        repoNameLabel.text = repository?.name
        descriptionLabel.text = repository?.description
        starredQuantityLabel.text = String(describing: repository!.stargazersCount)
    }
}

extension RepoCollectionViewCell: GitHubReposView {
    func style() {
        // collectionViewCell
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        
        // repoNameLabel
        repoNameLabel.text = ""
        repoNameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        // descriptionLabel
        descriptionLabel.text = ""
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        
        // starImageView
        starImage.tintColor = .lightGray
        
        // starredQuantityLabel
        starredQuantityLabel.text = "0"
        starredQuantityLabel.font = UIFont.systemFont(ofSize: 15)
        starredQuantityLabel.numberOfLines = 0
    }
    
    func layout() {
        contentView.subviews(
            repoNameLabel,
            descriptionLabel,
            starImage,
            starredQuantityLabel
        )
        
        // repoNameLabel
        repoNameLabel.top(16).right(16).left(16).height(20)
        
        // descriptionLabel
        descriptionLabel.Top == repoNameLabel.Bottom + 8
        descriptionLabel.right(16).left(16).height(40)
        
        // starImageView
        starImage.Top == descriptionLabel.Bottom + 8
        starImage.left(16).height(18).width(18)
        
        // starredQuantityLabel
        starredQuantityLabel.Leading == starImage.Trailing + 6
        starredQuantityLabel.height(15)
        
        align(horizontally: starImage, starredQuantityLabel)
    }
}
