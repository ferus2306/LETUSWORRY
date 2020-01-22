//
//  ItemCell.swift
//  LETUSWORRY
//
//  Created by Firus Hanov on 10/14/19.
//  Copyright © 2019 Firus Hanov. All rights reserved.
//

import UIKit

internal class ItemCell: UITableViewCell {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var pickUpDateLabel: UILabel!
    @IBOutlet var dropOffDateLabel: UILabel!
    @IBOutlet var userImageView: UIImageView!
    
    // FUNCTION IMPLEMENTED TO BRING DYNAMIC SIZE FOR EACH CELL
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        pickUpDateLabel.adjustsFontForContentSizeCategory = true
        dropOffDateLabel.adjustsFontForContentSizeCategory = true
        userImageView.adjustsImageSizeForAccessibilityContentSizeCategory = true
    }
    
}
