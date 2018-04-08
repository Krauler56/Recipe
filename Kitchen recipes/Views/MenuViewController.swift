//
//  MenuViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 07.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    

    
    
    
    
    @IBOutlet var mnTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        mnTableView.delegate = self
        mnTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       // let cell = menuTableView.dequeueReusableCell(withIdentifier: "MenuCell") as! MenuTableViewCell
        let cell = Bundle.main.loadNibNamed("MenuTableViewCell", owner: self, options: nil)?.first as! MenuTableViewCell
        switch indexPath.row {
        case 0:
            cell.imagee.image = #imageLiteral(resourceName: "icon-add-recipe")
        case 1:
            cell.imagee.image = #imageLiteral(resourceName: "icon-log-in")
        default:
            print("Error")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddNewRecipe", sender: self)
        self.hideMenu()
    }
    
}
