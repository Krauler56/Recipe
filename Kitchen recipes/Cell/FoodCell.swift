//
//  FoodCell.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 18.03.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit

class FoodCell : UITableViewCell {
    var message : String?
    var mainImage :UIImage?
    
    var messageView : UITextView = {
        var textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.isScrollEnabled = false
        textView.isEditable = false
        //  textView.font = .systemFont(ofSize: 20)
        return textView
    }()
    var mainImageView : UIImageView = {
        var imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(messageView)
        self.addSubview(mainImageView)
        
        mainImageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        mainImageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        mainImageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        mainImageView.bottomAnchor.constraint(equalTo: self.messageView.topAnchor).isActive = true
        mainImageView.heightAnchor.constraint(equalToConstant: 320).isActive = true
        
        messageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        messageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        messageView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        // messageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let message = message{
            messageView.text = message
        }
        
        if let image = mainImage {
            mainImageView.image = image
        }
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("Init has not been imp")
    }
}
