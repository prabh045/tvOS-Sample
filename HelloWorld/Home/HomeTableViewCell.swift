//
//  HomeTableViewCell.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    static let identifier = "homeCell"
    let dataSource = CollectionViewSource()
        
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Avengers Assemble"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  UIColor.black
        // label.backgroundColor =  UIColor.yellow
        //label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
        collectionView.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.identifier)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        print("Awake from nib ran")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .yellow
        self.contentView.addSubview(titleLabel)
        self.contentView.addSubview(collectionView)
        setupConstraints()
        print("style one ran")
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        print("Init coder ran")
    }
    
    private func setupConstraints() {
        let safeArea = self.contentView.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
    
            titleLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor,constant: 10),
            titleLabel.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: +10),
//            titleLabel.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -10),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -10),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 10),
            collectionView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -10),
//            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            collectionView.heightAnchor.constraint(equalToConstant: 180),
//            
        ])
    
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
                // `collectionView.contentSize` has a wrong width because in this nested example, the sizing pass occurs before the layout pass,
        // so we need to force a layout pass with the correct width.
        self.contentView.frame = self.bounds
        self.contentView.layoutIfNeeded()
        // Returns `collectionView.contentSize` in order to set the UITableVieweCell height a value greater than 0.
        return self.collectionView.contentSize
    }
}
