//
//  TableViewCell.swift
//  PruebasGrability
//
//  Created by Sdatas on 8/19/16.
//
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var imgCelda: UIImageView!
    @IBOutlet weak var lblCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        imgCelda.layer.borderWidth = 1
        imgCelda.layer.masksToBounds = false
        imgCelda.layer.borderColor = UIColor.blackColor().CGColor
        imgCelda.layer.cornerRadius = imgCelda.frame.height/2
        imgCelda.clipsToBounds = true
    }
    
}
