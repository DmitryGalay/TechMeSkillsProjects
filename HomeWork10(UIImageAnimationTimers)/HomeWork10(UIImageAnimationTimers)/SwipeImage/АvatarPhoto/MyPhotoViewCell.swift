//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Dima on 4.10.21.
//

import UIKit

class MyPhotoViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
