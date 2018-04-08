//
//  FoodViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 18.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit

class FoodViewController: UITableViewController {
    
    var data = [Recipe]()
    var foodType: FoodKind!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "TEST"
        data = recipes.filter({ $0.foodType == foodType})//foodInit.filter({ $0.foodType == foodType })
        self.tableView.register(FoodCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 150
         self.setSlideView()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("FoodCell", owner: self, options: nil)?.first as! FoodCell
        cell.mainImage.image = data[indexPath.row].image
        cell.message.text = data[indexPath.row].message
        cell.starView.rating = data[indexPath.row].rating!
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RecipeHandler.actualCheckedRecipe = data[indexPath.row]
       performSegue(withIdentifier: "toFoodMainViewSeg", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}
