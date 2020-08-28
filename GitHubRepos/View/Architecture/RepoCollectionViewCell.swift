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

extension RepoCollectionViewCell: GitHubReposView {
    func style() {
        // collectionViewCell
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        
        // repoNameLabel
        repoNameLabel.text = "RepoName"
        repoNameLabel.font = UIFont.boldSystemFont(ofSize: 20.0)
        
        // descriptionLabel
        descriptionLabel.text = "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they cannot foresee the pain and trouble that are bound to ensue; and equal blame belongs to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and easy to distinguish. In a free hour, when our power of choice is untrammelled and when nothing prevents our being able to do what we like best, every pleasure is to be welcomed and every pain avoided. But in certain circumstances and owing to the claims of duty or the obligations of business it will frequently occur that pleasures have to be repudiated and annoyances accepted. The wise man therefore always holds in these matters to this principle of selection: he rejects pleasures to secure other greater pleasures, or else he endures pains to avoid worse pains."
        descriptionLabel.font = UIFont.systemFont(ofSize: 13)
        descriptionLabel.numberOfLines = 0
        
        // starImageView
        starImage.tintColor = .lightGray
        
        // starredQuantityLabel
        starredQuantityLabel.text = "0"
        starredQuantityLabel.font = UIFont.systemFont(ofSize: 13)
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
        starredQuantityLabel.height(13)
        
        align(horizontally: starImage, starredQuantityLabel)
    }
}
