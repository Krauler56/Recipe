//
//  RecipeStepsAddViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 08.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation
import Regift
import SwiftyGif

class RecipeStepsAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,ChangePictureProtocol, recipeOpenVideoRecordProtocol  {
   
    
    
    weak var deleg: setAnimateInCell?
    
    @IBOutlet var recipeTableView: UITableView!
    
        override func viewDidLoad() {
        
        super.viewDidLoad()
        self.hideKeyboard()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
            
        let rightButtonItem = UIBarButtonItem.init(
                title: "Save",
                style: .done,
                target: self,
                action: #selector(rightButtonAction(sender:))
            )
            
        self.navigationItem.rightBarButtonItem = rightButtonItem
        
    }
    
    @objc func rightButtonAction(sender: UIBarButtonItem) {
        FutureRecipeHandler.futureRecipe?.steps = FutureRecipeHandler.futureSteps
        recipes.append(FutureRecipeHandler.futureRecipe!)
        self.performSegue(withIdentifier: "segToMainMenu", sender: self)
       
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RecipeStepAddCell", owner: self, options: nil)?.first as! RecipeStepAddCell
        cell.delegate = self;
        if (FutureRecipeHandler.futureSteps.count != 0 && indexPath.row < FutureRecipeHandler.futureSteps.count )  {
            print("IMMMMMM HEREEEEE")
            cell.recipeGif.animate(withGIFURL: (FutureRecipeHandler.futureSteps[indexPath.row].image)!)
        cell.recipeGif.startAnimatingGif()
        }
        deleg = cell
        cell.recipeGif.startAnimatingGif()
        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if FutureRecipeHandler.futureSteps.count == 0 {
            return 1
        }
        else {
            return (FutureRecipeHandler.futureSteps.count)+1
        }
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 640
    }
    
    func loadNewScreen(controller: UIViewController) {
        self.present(controller, animated: true) { () -> Void in
          
        };
    }
    func loadRecordScreen(controller: SNVideoRecorderViewController) {
        controller.delegate = self
         self.present(controller, animated: true) { () -> Void in
            
        };
    }
    func dismissNewScreen(controller: UIViewController)  {
        
        self.dismiss(animated: false, completion: nil) //{ () -> Void in
        
        // };
    }
    
  
    
}
