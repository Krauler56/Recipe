//
//  RecipeComponentCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 25.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class RecipeComponentCell: UITableViewCell {

    @IBOutlet weak var nameOfProduct: UILabel!
    @IBOutlet weak var countOfProduct: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
