//
//  ViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 17.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    var selectedFoodType: Int!
    var data = [FoodType]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data =  foodTypeInit
        
        self.tableView.register(FoodTypeCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableViewAutomaticDimension
      //  self.tableView.estimatedRowHeight = 200
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! FoodTypeCell
        cell.mainImage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.layoutSubviews()
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFoodType=indexPath.row
        performSegue(withIdentifier: "toFoodSeg", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? FoodViewController{
            destination.foodType = data[selectedFoodType].kind!
        }
        
        
    }
}

