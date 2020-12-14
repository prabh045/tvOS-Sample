//
//  StoryTableViewCell.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class StoryTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    let dataSource = CollectionViewSource()
    static let identifier = "storyTableCell"
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleLabel.text = "Avengers Assemble!!!"
        let nibName = UINib(nibName: "StoryCollectionViewCell", bundle:nil)
        collectionView.register(nibName, forCellWithReuseIdentifier: StoryCollectionViewCell.identifier)
        collectionView.dataSource = dataSource
        collectionView.delegate = dataSource
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
