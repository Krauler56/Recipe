//
//  RecipeMainViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 25.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//
import Foundation

import UIKit
import Cosmos

class RecipeMainViewController: UITableViewController {
    
var data = Recipe()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        data = repice_golabki
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = Bundle.main.loadNibNamed("RecipeMainCell", owner: self, options: nil)?.first as! RecipeMainCell
        cell.recipeImage.image = #imageLiteral(resourceName: "golabki.jpg")
  //  let cell = Bundle.main.loadNibNamed("RecipeComponentCell", owner: self, options: nil)?.first as! RecipeComponentCell
  //  cell.nameOfProduct.text = data.products![indexPath.row].0.message!
   // cell.countOfProduct.text = String(data.products![indexPath.row].1)+" "+data.products![indexPath.row].0.measure!
        return cell
   }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 1//data.products!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        // if indexPath.row == 0{
        //  return 70.0
        
        //}
        return 350
    }
    
  
    
}
