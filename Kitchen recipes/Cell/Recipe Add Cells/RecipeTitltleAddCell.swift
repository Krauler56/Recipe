//
//  RecipeTitltleAddCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 02.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import UIKit

class RecipeTitltleAddCell: UITableViewCell, UIPickerViewDataSource, UIPickerViewDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    weak var delegate: ChangePictureProtocol?
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return  String(row+1)
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int)
    {
        selectedValue = row+1 
    }
    @IBOutlet var titleImage: UIImageView!
    
    
    @IBOutlet var inputNameOfRecipe: UITextField!
    
    
    @IBOutlet var numberOfPartitions: UIPickerView!
    var selectedValue: Int!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.numberOfPartitions.dataSource = self;
        self.numberOfPartitions.delegate = self;
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
      //  titleImage.image = generateImageWithText(text: "Tap here to do photo")
     
        titleImage.isUserInteractionEnabled = true
        titleImage.addGestureRecognizer(tapGestureRecognizer)
        
        selectedValue = 1
        // Initialization code
    }
   
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.camera;
            imagePicker.allowsEditing = false
            delegate?.loadNewScreen(controller: imagePicker);//self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        // Your action
    }
    
    func checkInputData() -> Bool
    {
        return (inputNameOfRecipe.text?.isEmpty)! ? false : true
        
    }
    @IBAction func addRecipeButton(_ sender: Any) {
       /* if (checkInputData()) {
            var recipeToAppend = Recipe(image: titleImage.image,message: inputNameOfRecipe.text,rating: 4,numberOfRating: 0,numberOfPortions: selectedValue ,steps:[Step.init()]
                ,products: [(products[0],1),(products[1],1000),(products[2],1),(products[3],2),(products[4],1),(products[5],200),(products[6],100)],foodType: FoodKind.mainFood)
            recipes.append(recipeToAppend)
        }*/
        
        if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RecipeStepsAddViewController") as? RecipeStepsAddViewController
        {
            delegate?.loadNewScreen(controller: vc)
        }
    }
   
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            titleImage.image = image
        }
        
        picker.dismiss(animated: true, completion: nil);
    }
}

protocol ChangePictureProtocol : NSObjectProtocol {
    func loadNewScreen(controller: UIViewController) -> Void
    func dismissNewScreen(controller: UIViewController) -> Void
}


