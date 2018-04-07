//
//  MenuTableViewCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 07.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    
    
    @IBOutlet var imagee: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
