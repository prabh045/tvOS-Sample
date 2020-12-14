//
//  CollectionViewSource.swift
//  HelloWorld
//
//  Created by Prabhdeep Singh on 14/12/20.
//  Copyright © 2020 Prabh. All rights reserved.
//

import UIKit

class CollectionViewSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
     let sectionInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.identifier, for: indexPath) as? HomeCollectionCell else {
            fatalError()
        }
        return cell
    }
    
    
    //delegates
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
////        let padding = sectionInsets.left * (5 + 1)
////        let availableWidth = collectionView.frame.width - padding
////        let widthPerItem = availableWidth / 5
////        return CGSize(width: widthPerItem, height: collectionView.frame.size.height-(sectionInsets.top + sectionInsets.bottom)-10)
//        return CGSize(width: 150, height: 150)
//    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 4
    }

}
