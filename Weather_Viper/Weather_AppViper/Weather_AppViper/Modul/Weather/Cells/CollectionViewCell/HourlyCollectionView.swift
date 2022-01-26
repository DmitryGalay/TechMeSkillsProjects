//
//  DynamicHeightCollectionView.swift
//  Weather_AppViper
//
//  Created by Dima on 26.01.22.
//

import UIKit

class HourlyCollectionView: UICollectionView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if bounds.size != intrinsicContentSize {
            self.invalidateIntrinsicContentSize()
        }
    }
    override var intrinsicContentSize: CGSize {
        return collectionViewLayout.collectionViewContentSize
    }
}
