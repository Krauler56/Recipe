//
//  RecipeHandler.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 08.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import Regift

class RecipeHandler {
    
    static var actualCheckedRecipe: Recipe?
}



class FutureRecipeHandler {
    static var futureRecipe: Recipe?
    static var futureSteps: [Step] = [Step]()
    static var futureProducts: [(Product,Int)] = [(Product,Int)]()
}

class SlideMenuHandler {
    
    static var slideMenu: MenuViewController?
}

class UrlVideoHandler {
    
    static var  urlOfVideo: URL!
    static var  regiftImege: Regift!
}
