//
//  RecipeHandler.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 08.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import Regift
import Firebase
import FirebaseDatabase

class RecipeHandler {
    
    static var actualCheckedRecipe: Recipe?
}



class FutureRecipeHandler {
    static var futureRecipe: Recipe?
    static var futureSteps: [Step] = [Step]()
    static var futureProducts: [(Product,Int)] = [(Product,Int)]()
    
    static func setNull() -> Void {
        futureRecipe = Recipe()
        futureSteps = [Step]()
        futureProducts = [(Product,Int)]()
    }
    
   static func textToImage(drawText text: String, inImage image: UIImage, atPoint point: CGPoint) -> UIImage {
        let textColor = UIColor.white
        let textFont = UIFont(name: "Helvetica Bold", size: 12)!
        
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(image.size, false, scale)
        
        let textFontAttributes = [
            NSAttributedStringKey.font: textFont,
            NSAttributedStringKey.foregroundColor: textColor,
            ] as [NSAttributedStringKey : Any]
        image.draw(in: CGRect(origin: CGPoint.zero, size: image.size))
        
        let rect = CGRect(origin: point, size: image.size)
        text.draw(in: rect, withAttributes: textFontAttributes)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}


class DBHandler {
    
    static var dbReference: DatabaseReference = Database.database().reference()
}

class SlideMenuHandler {
    
    static var slideMenu: MenuViewController?
}

class UrlVideoHandler {
    
    static var  urlOfVideo: URL!
    static var  regiftImege: Regift!
}
