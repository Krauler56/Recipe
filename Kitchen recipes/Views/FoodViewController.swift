//
//  FoodViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 18.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation

import UIKit

class FoodViewController: UITableViewController{
    
    var data = [FoodType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data =  [FoodType.init(image:#imageLiteral(resourceName: "mainFoodImage"),message: "Главные блюда")]
        
        self.tableView.register(FoodCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 200
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
        
    }
    

    
}
