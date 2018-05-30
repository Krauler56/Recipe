//
//  Recipe.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 25.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit
import Gifu
import ObjectMapper

struct Recipe {
    var image: UIImage?
    var message: String?
    var rating: Double?
    var numberOfRating: Int?
    var numberOfPortions: Int?
    var steps: [Step]?
    var products: [(Product,Int)]?
    var foodType: FoodKind?
    
    func toJSON() -> Dictionary<String, String> {
        
        return ["message" : message!, "rating": String(format:"%f", rating!), "numberOfRating": numberOfRating.map(String.init) ?? "", "numberOfPortions": numberOfPortions.map(String.init) ?? ""]
    }
}

struct Step {
    var image: URL?
    var message: String?
    var number: Int?
}

struct Product {
    var message : String?
    var measure : String?
}


var products: [Product] = [Product.init(message: "Kapusta",measure: "glowka"),
                           Product.init(message: "Mieso mielone wieprzowe",measure: "gr."),
                           Product.init(message: "Ryz",measure: "gr."),
                           Product.init(message: "Cebule",measure: "szt."),
                           Product.init(message: "Marchew",measure: "szt."),
                           Product.init(message: "Śmietana",measure: "gr."),
                           Product.init(message: "Sos pomidorowy",measure: "ml.")]
//var products: [Product] = [Product.init(message: "Test", measure: "Test")]
var imgView: UIImageView = UIImageView()

var recipes: [Recipe] = [Recipe.init(image: #imageLiteral(resourceName: "golabki.jpg"),message: "Golabki piekne",rating: 4,numberOfRating: 10,numberOfPortions: 3 ,steps:
    [(Step.init(image: Bundle.main.url(forResource: "1", withExtension: "gif") ,message: "Nacieramy marchew oraz kroimy cebulę",number: 1))
    ,(Step.init(image: Bundle.main.url(forResource: "2", withExtension: "gif") ,message: "Rozdrobniony łuk i marchew dodajemy do talerza z miełonym mięsem wieprzowym",number: 2))
    ,(Step.init(image: Bundle.main.url(forResource: "3", withExtension: "gif") ,message: "Oczyszczoną oraz umytą wcześniej kapustę kroimy do malutkich kawałeczków i dodajemy do talerza",number: 3))
    ,(Step.init(image: Bundle.main.url(forResource: "4", withExtension: "gif") ,message: "Dodajemy przygotowany ryż, pieprz czarny oraz jajka",number: 4))
    ,(Step.init(image: Bundle.main.url(forResource: "5", withExtension: "gif") ,message: "Lepimy z otrzymanej mieszanki gołąbki",number: 5))
    ,(Step.init(image: Bundle.main.url(forResource: "6", withExtension: "gif") ,message: "Na rozgrzaną patelnię z olejem wykładamy gołąbki",number: 6))
    ,(Step.init(image: Bundle.main.url(forResource: "7", withExtension: "gif") ,message: "Przygotowujemy sos który składa się z sosu pomidorowego i śmietany, oraz zalewamy nim gołąbki w pojemniku",number: 7))
    ,(Step.init(image: Bundle.main.url(forResource: "8", withExtension: "gif") ,message: "Pieczemy 15 minut w piekarniku przy temperaturze 200 stopni",number: 8))
    
    
    
    ],
                                         products: [(products[0],1),(products[1],1000),(products[2],1),(products[3],2),(products[4],1),(products[5],200),(products[6],100)],

                                         foodType: FoodKind.mainFood)]







extension UIImageView: GIFAnimatable {
    private struct AssociatedKeys {
        static var AnimatorKey = "gifu.animator.key"
    }
    
    override open func display(_ layer: CALayer) {
        updateImageIfNeeded()
    }
    
    public var animator: Animator? {
        get {
            guard let animator = objc_getAssociatedObject(self, &AssociatedKeys.AnimatorKey) as? Animator else {
                let animator = Animator(withDelegate: self)
                self.animator = animator
                return animator
            }
            
            return animator
        }
        
        set {
            objc_setAssociatedObject(self, &AssociatedKeys.AnimatorKey, newValue as Animator?, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }
}

