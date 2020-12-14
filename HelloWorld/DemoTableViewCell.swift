//
//  DemoTableViewCell.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 11/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class DemoTableViewCell: UITableViewCell {
    
    static let identifier = "tableCell"
    
    let thumbNailImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "avengers")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Avengers assemble"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor =  UIColor.gray
        // label.backgroundColor =  UIColor.yellow
        //label.layer.cornerRadius = 5
        label.clipsToBounds = true
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        self.contentView.addSubview(thumbNailImageView)
        self.contentView.addSubview(titleLabel)
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
            thumbNailImageView.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 10),
            thumbNailImageView.topAnchor.constraint(equalTo: safeArea.topAnchor,constant: 10),
            thumbNailImageView.heightAnchor.constraint(equalToConstant: 40),
            thumbNailImageView.widthAnchor.constraint(equalToConstant: 40),
            //            thumbNailImageView.bottomAnchor.constraint(equalTo: safeArea.bottomAnchor,constant: -10),
            
            titleLabel.leadingAnchor.constraint(equalTo: thumbNailImageView.trailingAnchor,constant: 10),
            titleLabel.centerYAnchor.constraint(equalTo: thumbNailImageView.centerYAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor,constant: -10),
            
        ])
        
    }
    
    
    
    
}

extension DemoTableViewCell {
    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
            super.didUpdateFocus(in: context, with: coordinator)
            debugPrint("DetailOptionTableViewCell", context)
            coordinator.addCoordinatedAnimations({
                if self.isFocused {
                    self.contentView.backgroundColor = .red
                } else {
                    self.contentView.backgroundColor = .white
                }
            }, completion: nil)
        }
    }
