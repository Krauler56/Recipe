//
//  ViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 17.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit
import Gifu
import SideMenu


class ViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    
  
    var selectedFoodType: Int!
    var data = [FoodType]()
    
    @IBOutlet var tableView: UITableView!
    
    @IBOutlet var menuBarButton_Item: UIBarButtonItem!
    
      var menuVC: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data =  foodTypeInit
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.register(FoodTypeCell.self, forCellReuseIdentifier: "custom")
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        self.setSlideView()
        var parameters  = ["image" : "test","message" : "test","rating": "test", "numberOfRating": "test","numberOfPortions": "test"]
        var test: String = "Test"
        DBHandler.dbReference.child("Step").childByAutoId().child("Name").setValue(parameters)
    
        
        //DBHandler.dbReference.child("Step").childByAutoId().child("Number").setValue("1")
     //   DBHandler.dbReference.child("Recipe").childByAutoId().child("Step").setNilValueForKey("1")
       // DBHandler.dbReference.child("name").childByAutoId().setValue("test1")
       // DBHandler.dbReference.child("name").childByAutoId().setValue("test2")

        //self.hideKeyboard()
        
        /*menuVC = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)*/
      //  self.tableView.estimatedRowHeight = 200
        
    }
    
    /*@objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
        switch gesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            print("Right")
            hideMenu()
        case UISwipeGestureRecognizerDirection.left:
            print("Left")
            showMenu()
        default: break
        }
    }
    
    func showMenu() {
        print("Showmenu")
        UIView.animate(withDuration: 0.3) {
            //self.menuVC.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menuVC.view.frame = CGRect(x: 60, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.addChildViewController(self.menuVC)
            self.view.addSubview(self.menuVC.view)
            AppDelegate.isMenuVC = false
        }
    }
    
    func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            self.menuVC.view.frame = CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menuVC.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }
    */
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "custom") as! FoodTypeCell
        cell.mainImage = data[indexPath.row].image
        cell.message = data[indexPath.row].message
        cell.layoutSubviews()
        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedFoodType=indexPath.row
        performSegue(withIdentifier: "toFoodSeg", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
         if let destination = segue.destination as? FoodViewController{
            destination.foodType = data[selectedFoodType].kind!
        }
       
    }
    /*
    @IBAction func menuBarButton_Item(_ sender: Any) {
        
        if AppDelegate.isMenuVC {
            showMenu()
        } else {
            
            hideMenu()
            
            
        }
        
        print("WORK")
    }*/
    
 
}



