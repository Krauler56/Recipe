//
//  Recipe.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 25.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit

struct Recipe {
    var image: UIImage?
    var message: String?
    var steps: [(Step,[Product])]?
    var products: [(Product,Int)]?
}

struct Step {
    var image: UIImage?
    var message: String?
    var number: Int?
}

struct Product {
    var message : String?
    var measure : String?
}


var products: [Product] = [Product.init(message: "Kapusta",measure: "g"),Product.init(message: "Mieso mielone wieprzowe",measure: "g"),Product.init(message: "Ryz",measure: "g"),Product.init(message: "Marchew",measure: "g")]
//var products: [Product] = [Product.init(message: "Test", measure: "Test")]

var repice_golabki: Recipe = Recipe.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "Golabki piekne",steps: [(Step.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "First step",number: 1),[products[0]])
    ,(Step.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "Second step",number: 2),[products[1],products[2]])
    ,(Step.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "Last step",number: 3),[products[3]])],
                                         products: [(products[0],500),(products[1],540),(products[2],200),(products[3],700)])
