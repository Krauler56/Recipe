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

class RecipeStepsAddViewController: UIViewController, UITableViewDelegate, UITableViewDataSource ,ChangePictureProtocol, recipeOpenVideoRecordProtocol  {
    
    
    
    @IBOutlet var recipeTableView: UITableView!
    
        override func viewDidLoad() {
        
        super.viewDidLoad()
        
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("RecipeStepAddCell", owner: self, options: nil)?.first as! RecipeStepAddCell
        cell.delegate = self;

        return cell
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      
    }
     func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       
        return 640
    }
    
    func loadNewScreen(controller: UIViewController) {
        self.present(controller, animated: true) { () -> Void in
            print("ISSSSSS WORK")
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
