//
//  RecipeTitleAddViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 02.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit

class RecipeTitleAddTableViewController: UITableViewController ,ChangePictureProtocol,MyCustomCellDelegator{

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboard()
      
        
    }
    
   
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RecipeTitltleAddCell", owner: self, options: nil)?.first as! RecipeTitltleAddCell
      //  cell.recipeImage.image = #imageLiteral(resourceName: "golabki.jpg")//UIImage.gif(name: "ezgif-4-ed2350780b")
     //   cell.rating.rating = data.rating!
       // cell.countOfRatingPersonLabel.text = "\(data.numberOfRating ?? 0)"
        //cell.countOfPortion.text = "\(data.numberOfPortions ?? 0)"
        cell.delegate = self
        cell.cellDelegate = self
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 600
    }
    
    func loadNewScreen(controller: UIViewController) {
        
        self.present(controller, animated: true) { () -> Void in
           
        };
    }
    
    func dismissNewScreen(controller: UIViewController)  {
        
        self.dismiss(animated: false, completion: nil) //{ () -> Void in
            
       // };
    }
    
    func callSegueFromCell() {
        self.performSegue(withIdentifier: "segTitleToComp", sender: self)
    }
    
    
   
}


