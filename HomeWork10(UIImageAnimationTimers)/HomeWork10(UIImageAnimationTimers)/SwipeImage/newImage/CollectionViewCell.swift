//
//  CollectionViewCell.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 17.11.21.
//

import UIKit
import Gemini

class CollectionViewCell: GeminiCell {
    
    @IBOutlet weak var mainImageView: UIImageView!
    
    func setCell(imageName: String ) {
        mainImageView.image = UIImage(named: imageName)
    }
//    override func layoutSubviews() {
//        super.layoutSubviews()
//        mainImageView.frame = contentView.bounds
//    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        mainImageView.image = nil
    }
}
