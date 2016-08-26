//
//  CollectionViewCell.swift
//  PruebasGrability
//
//  Created by Sdatas on 8/18/16.
//
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var imgCelda: UIImageView!
    @IBOutlet weak var lblCelda: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        imgCelda.layer.borderWidth = 1
        imgCelda.layer.masksToBounds = false
        imgCelda.layer.borderColor = UIColor.blackColor().CGColor
        imgCelda.layer.cornerRadius = imgCelda.frame.height/2
        imgCelda.clipsToBounds = true
    }

}
