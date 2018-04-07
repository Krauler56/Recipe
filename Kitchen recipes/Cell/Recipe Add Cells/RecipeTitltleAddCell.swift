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

    
    @IBOutlet var titleImage: UIImageView!
    
    
    @IBOutlet var inputNameOfRecipe: UITextField!
    
    
    @IBOutlet var numberOfPartitions: UIPickerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.numberOfPartitions.dataSource = self;
        self.numberOfPartitions.delegate = self;
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
      //  titleImage.image = generateImageWithText(text: "Tap here to do photo")
     
        titleImage.isUserInteractionEnabled = true
        titleImage.addGestureRecognizer(tapGestureRecognizer)
        
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
    

    @IBAction func addRecipeButton(_ sender: Any) {
        
        print("DZIALA")
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


