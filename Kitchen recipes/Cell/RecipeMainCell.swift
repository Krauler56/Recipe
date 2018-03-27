//
//  RecipeMainCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 25.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit
import Cosmos

class RecipeMainCell: UITableViewCell {

    @IBOutlet var recipeImage: UIImageView!
    @IBOutlet var rating: CosmosView!
    
    @IBOutlet var countOfPortion: UILabel!
    @IBOutlet var countOfRatingPersonLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
   
        
        // Configure the view for the selected state
    }
    
}
