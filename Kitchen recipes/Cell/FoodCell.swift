//
//  FoodCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 08.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit
import Cosmos

class FoodCell: UITableViewCell {

    @IBOutlet var starView: CosmosView!
    @IBOutlet var message: UILabel!
    @IBOutlet var mainImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

