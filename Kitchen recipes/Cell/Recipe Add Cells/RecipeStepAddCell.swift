//
//  RecipeStepAddCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 08.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit
import Regift
import SwiftyGif

class RecipeStepAddCell: UITableViewCell , setAnimateInCell {
 
    
    weak var delegate: recipeOpenVideoRecordProtocol?
    @IBOutlet var recipeAddStepTextView: UITextView!
    @IBOutlet var recipeGif: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        //  titleImage.image = generateImageWithText(text: "Tap here to do photo")
        
        recipeGif.isUserInteractionEnabled = true
        recipeGif.addGestureRecognizer(tapGestureRecognizer)
       
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if(UrlVideoHandler.regiftImege != nil) {
        recipeGif.animate(withGIFURL: UrlVideoHandler.regiftImege.createGif()!)
        recipeGif.startAnimatingGif()
        }
        // Configure the view for the selected state
    }
    
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        
        let vc = SNVideoRecorderViewController()
        // flashlight icons
        vc.flashLightOnIcon = UIImage(named: "flash_light_50")
        vc.flashLightOffIcon = UIImage(named: "flash_light_off_50")
        
        // switch camera icon
        vc.switchCameraOption.setImage(UIImage(named: "switch_camera_50")?.withRenderingMode(.alwaysTemplate), for: .normal)
        
        // close options
        vc.closeOption.isHidden = true
        vc.closeOption.setImage(UIImage(named: "delete_50")?.withRenderingMode(.alwaysTemplate), for: .normal)
        // preview text
        vc.agreeText = "ok"
        vc.discardText = "discard"
        
        // max seconds able to record
        vc.maxSecondsToRecord = 5
        
        // start camera position
        vc.initCameraPosition = .back
        
       delegate?.loadRecordScreen(controller: vc)
    }
    
    func loadGifToImageView(with: URL) {
        
           // recipeGif.animate(withGIFURL: with)
            //recipeGif.startAnimatingGif()
            FutureRecipeHandler.futureSteps.append(Step.init(image: with ,message: "Nacieramy marchew oraz kroimy cebulę",number: FutureRecipeHandler.futureSteps.count))
    }
}

protocol recipeOpenVideoRecordProtocol  : NSObjectProtocol {
     func loadRecordScreen(controller: SNVideoRecorderViewController) -> Void
}

protocol setAnimateInCell : NSObjectProtocol {
    func loadGifToImageView(with: URL) -> Void
}





