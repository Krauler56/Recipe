//
//  FoodTypeInit.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 24.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit
import SwiftGifOrigin

var foodTypeInit =  [FoodType.init(image:#imageLiteral(resourceName: "mainFoodImage.jpg"),message: "Glowne dania", kind: FoodKind.mainFood)
    ,FoodType.init(image: #imageLiteral(resourceName: "soupeImage.jpg"),message: "Zupy", kind: FoodKind.soupe)
    ,FoodType.init(image: #imageLiteral(resourceName: "salatImage.jpg"),message: "Salatki", kind: FoodKind.salat)
    ,FoodType.init(image:#imageLiteral(resourceName: "desertImage.jpg"),message: "Desery", kind: FoodKind.desert)
    ,FoodType.init(image:#imageLiteral(resourceName: "snackImage.jpg"),message: "Przekąski", kind: FoodKind.snack)]


var foodInit:[Food] =  [Food.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "Golabki", rank: 2, foodType: FoodKind.mainFood),
                 Food.init(image:#imageLiteral(resourceName: "schabowy.jpg"),message: "Kotlet schabowy", rank: 5, foodType: FoodKind.mainFood),
                 Food.init(image:#imageLiteral(resourceName: "bigos"),message: "Bigos", rank: 4, foodType: FoodKind.mainFood),
                 Food.init(image:#imageLiteral(resourceName: "barszcz_czerwony"),message: "Barszcz czerwony", rank: 2, foodType: FoodKind.soupe),
                 Food.init(image:#imageLiteral(resourceName: "zurek_z_jajkiem.jpg"),message: "Żurek z jajkiem", rank: 5, foodType: FoodKind.soupe),
                 Food.init(image:#imageLiteral(resourceName: "rosol.jpg"),message: "Rosól", rank: 1, foodType: FoodKind.soupe)]



