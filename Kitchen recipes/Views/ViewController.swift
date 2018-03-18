//
//  ViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 17.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    var data = [FoodType]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data =  [FoodType.init(image:#imageLiteral(resourceName: "mainFoodImage"),message: "Главные блюда")
                ,FoodType.init(image: #imageLiteral(resourceName: "soupeImage.jpg"),message: "Супы")
                ,FoodType.init(image: #imageLiteral(resourceName: "salatImage.jpg"),message: "Салаты")
                ,FoodType.init(image:#imageLiteral(resourceName: "desertImage.jpg"),message: "Десерты")
                ,FoodType.init(image:#imageLiteral(resourceName: "snackImage.jpg"),message: "Закуски")]
        
        self.tableView.register(FoodTypeCell.self, forCellReuseIdentifier: "custom")
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
        print("section: \(indexPath.section)")
        print("row: \(indexPath.row)")
        let enrolledView = self.storyboard?.instantiateViewController(withIdentifier: "identifier of your DetailsViewController")
        self.navigationController?.pushViewController(enrolledView!, animated: true)
    }
    
}

