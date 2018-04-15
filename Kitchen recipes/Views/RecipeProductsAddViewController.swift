//
//  RecipeProductsAddViewController.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 15.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class RecipeProductsAddViewControlller: UIViewController, UITextFieldDelegate, UITableViewDelegate, UITableViewDataSource, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var selectedValue: String = "Kg"
    
    
    @IBOutlet var measurePickerView: UIPickerView!
    @IBOutlet var tableView: UITableView!
    @IBOutlet var textField: UITextField!
    
    @IBOutlet var textFieldCount: UITextField!
    var measures: [String] = ["Kg","g","l"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        
        self.measurePickerView.dataSource = self;
        self.measurePickerView.delegate = self;
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        self.hideKeyboard()
    }
    
    
    @IBAction func addButtonTap(_ sender: Any) {
        insertNewVideoTitle()
    }

    
    @IBAction func nextStepTap(_ sender: Any) {
        FutureRecipeHandler.futureRecipe?.products = FutureRecipeHandler.futureProducts
        self.performSegue(withIdentifier: "segTittleToVideo", sender: self)
    }
    func insertNewVideoTitle() {
        
        FutureRecipeHandler.futureProducts.append((Product.init(message: textField.text,measure: selectedValue),Int(textFieldCount.text!)!))
        tableView.reloadData()
        textField.text = ""
        view.endEditing(true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FutureRecipeHandler.futureProducts.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //   let videoTitle = videos[indexPath.row]
        
        let cell = Bundle.main.loadNibNamed("RecipeComponentCell", owner: self, options: nil)?.first as! RecipeComponentCell
        //  cell.videoTitle.text = videoTitle
        cell.nameOfProduct.text = FutureRecipeHandler.futureProducts[indexPath.row].0.message
        cell.countOfProduct.text = String(FutureRecipeHandler.futureProducts[indexPath.row].1)+" "+FutureRecipeHandler.futureProducts[indexPath.row].0.measure!
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            FutureRecipeHandler.futureProducts.remove(at: indexPath.row)
            
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return measures.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  measures[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedValue = measures[row]
    }
}



