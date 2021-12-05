//
//  TableViewCell.swift
//  TableView
//
//  Created by Dima on 11.11.21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var labelComments: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)


    }
}
