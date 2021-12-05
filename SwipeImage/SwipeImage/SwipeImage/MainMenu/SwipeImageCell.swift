//
//  SwipeImageCell.swift
//  HomeWork10(UIImageAnimationTimers)
//
//  Created by Dima on 18.11.21.
//

import UIKit
import Gemini

class SwipeImageCell: GeminiCell {
    
    @IBOutlet weak var swipeImageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        swipeImageView.image = nil
    }
}
