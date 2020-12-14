//
//  HomeCollectionCell.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class HomeCollectionCell: UICollectionViewCell {
    
    //MARK: Properties
    static let identifier = "homeCell"
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "avengers")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 7
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    //MARK: Initialisers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: UI SetUp
    private func setupUI() {
        contentView.addSubview(containerView)
        containerView.addSubview(imageView)
        setupConstraints()
    }
    
    //MARK: Constraint Setup
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            containerView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            containerView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor),
            
            imageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            imageView.topAnchor.constraint(equalTo: containerView.topAnchor,constant: 0),
            imageView.heightAnchor.constraint(equalToConstant: 150),
            imageView.widthAnchor.constraint(equalToConstant: 150),
//            imageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        ])
    }
    
    
    
}
