//
//  RecipeStepCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 27.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class RecipeStepCell: UITableViewCell {

    @IBOutlet var stepImage: UIImageView!
    
    
    @IBOutlet var stepTextView: UITextView!
    
    
    @IBOutlet var numberOfStepLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        numberOfStepLabel.layer.backgroundColor = UIColor.red.cgColor
        numberOfStepLabel.layer.cornerRadius = 15
        stepTextView.isEditable = false
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        stepImage.isUserInteractionEnabled = true
        stepImage.addGestureRecognizer(tapGestureRecognizer)
       // stepImage.stopAnimatingGIF()
        //stepImage.startAnimatingGIF()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //stepImage.startAnimatingGIF()
        // Configure the view for the selected state
    }
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        let tappedImage = tapGestureRecognizer.view as! UIImageView
        print(tappedImage)
        if stepImage.isAnimatingGIF {
            stepImage.stopAnimatingGIF()
        } else {
            stepImage.startAnimatingGIF()
        }
        // Your action
    }
    func didSelect(indexPath: NSIndexPath ) {
     //   stepImage.startAnimating()
        
        // perform some actions here
    }
    
}
