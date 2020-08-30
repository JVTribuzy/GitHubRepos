//
//  PullCollectionViewCell.swift
//  GitHubRepos
//
//  Created by João Tribuzy on 30/08/20.
//  Copyright © 2020 João Tribuzy. All rights reserved.
//
//
import UIKit
import Stevia

class PullCollectionViewCell: UICollectionViewCell {
    
    private var pull: Pull? = nil
    
    // MARK: - Components
    private let pullTitle: UILabel = UILabel()
    private let numberLabel: UILabel = UILabel()
    
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

extension PullCollectionViewCell {
    public func fill(with pull: Pull?) {
        self.pull = pull
        
        guard pull != nil else { return }
        
        pullTitle.text = pull?.title
        numberLabel.text = String(describing: "#\(pull!.number)")
    }
}

extension PullCollectionViewCell: GitHubReposView {
    func style() {
        // collectionViewCell
        self.layer.cornerRadius = 8
        self.layer.masksToBounds = true
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.gray.cgColor
        
        // pullTitle
        pullTitle.text = "good-ios"
        pullTitle.font = UIFont.boldSystemFont(ofSize: 20.0)
        pullTitle.numberOfLines = 0
        
        // numberLabel
        numberLabel.text = "#2345"
        numberLabel.font = UIFont.systemFont(ofSize: 20.0)
        numberLabel.textColor = .gray
    }
    
    func layout() {
        contentView.subviews(
            pullTitle,
            numberLabel
        )
        
        // pullTitle
        pullTitle.top(16).leading(16).trailing(16)
        
        // numberLabel
        numberLabel.Top == pullTitle.Bottom + 8
        numberLabel.leading(16).trailing(16)
    }
}
