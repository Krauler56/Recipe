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
import SwiftyGif

class RecipeMainViewController: UITableViewController {
    
var data = Recipe()
    
    var cellArray: [RecipeStepCell]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        data = repice_golabki
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.row == 0 {
       let cell = Bundle.main.loadNibNamed("RecipeMainCell", owner: self, options: nil)?.first as! RecipeMainCell
        cell.recipeImage.image = #imageLiteral(resourceName: "golabki.jpg")//UIImage.gif(name: "ezgif-4-ed2350780b")
        cell.rating.rating = data.rating!
        cell.countOfRatingPersonLabel.text = "\(data.numberOfRating ?? 0)"
        cell.countOfPortion.text = "\(data.numberOfPortions ?? 0)"
        return cell
    }
    else  {
        let cell = Bundle.main.loadNibNamed("RecipeStepCell", owner: self, options: nil)?.first as! RecipeStepCell
        cell.numberOfStepLabel.text = String("\(data.steps![indexPath.row-1].number ?? 0)")
        cell.stepImage.animate(withGIFNamed: data.steps![indexPath.row-1].image!)//data.steps![indexPath.row-1].image)//data.steps![indexPath.row-1].image
        cell.stepTextView.text = data.steps![indexPath.row-1].message
        cell.stepImage.stopAnimatingGIF()
        cell.stepImage.image = cell.stepImage.activeFrame
        cellArray?.append(cell)
        //cell.recipeImage.image = #imageLiteral(resourceName: "golabki.jpg")//UIImage.gif(name: "ezgif-4-ed2350780b")
        //cell.rating.rating = data.rating!
        //cell.countOfRatingPersonLabel.text = "\(data.numberOfRating ?? 0)"
        //cell.countOfPortion.text = "\(data.numberOfPortions ?? 0)"
        return cell
    }
    let cell = Bundle.main.loadNibNamed("EmptyCell", owner: self, options: nil)?.first as! EmptyCell
    return cell
   }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) as? RecipeStepCell {
            cell.didSelect(indexPath: indexPath as NSIndexPath)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (data.steps?.count)!+1//data.products!.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
         return self.view.window!.frame.size.height-49-33-30
        }
        else {
            return (self.view.window!.frame.size.height-49-33-30)/2
        }
        return 100
    }

}
