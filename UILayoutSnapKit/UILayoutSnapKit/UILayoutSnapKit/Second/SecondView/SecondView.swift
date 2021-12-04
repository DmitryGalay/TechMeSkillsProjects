//
//  SecondView.swift
//  UILayoutSnapKit
//
//  Created by Dima on 28.11.21.
//

import Foundation
import UIKit
import Rswift
import SnapKit

enum ImageName {
    case first
    case second
    case third
    case fourth
    var imagename: String {
        switch self {
        case .first:
            return "person"
        case .second:
            return "headphones"
        case .third:
            return "doc.text.fill"
        case .fourth:
            return "faceid"
            
        }
    }
    
}

class SecondView: UIView {
    @IBOutlet weak var firstDetailLabel: UILabel!
    @IBOutlet weak var secondDetailLabel: UILabel!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailButton: UIButton!
    
    func createfirstDetailLabel(text: String,size: CGFloat) {
        firstDetailLabel.setText(text, withColorPart: "", color: .red)
        firstDetailLabel.backgroundColor = .white
        firstDetailLabel.font = firstDetailLabel.font.with(traits: [.traitBold,.traitCondensed]).withSize(size)
        firstDetailLabel.textColor = .black
        firstDetailLabel.textAlignment = .center
    }
    
    func createsecondDetailLabel(text: String,size: CGFloat) {
        secondDetailLabel.setText(text, withColorPart: "", color: .red)
        secondDetailLabel.backgroundColor = .white
        secondDetailLabel.font = secondDetailLabel.font.with(traits: .traitCondensed).withSize(size)
        secondDetailLabel.textColor = .lightGray
        secondDetailLabel.textAlignment = .center
    }
    
    func createdetailImage() {
        detailImage.layer.borderWidth = 0.5
        detailImage.layer.cornerRadius = 10
        detailImage.layer.borderColor =  #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        switch detailImage.tag {
        case 1:
            detailImage.image = UIImage(systemName: "person")
        case 2:
            detailImage.image = UIImage(systemName: "headphones")
        case 3:
            detailImage.image = UIImage(systemName: "doc.text.fill")
        case 4:
            detailImage.image = UIImage(systemName: "faceid")
        default:
            break
        }
    }
    
    func createdetailButton() {
        detailButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
    }
}
