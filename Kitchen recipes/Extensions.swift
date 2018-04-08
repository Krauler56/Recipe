//
//  Extensions.swift
//  Kitchen recipes
//
//  Created by Valentin Nacharov on 02.04.2018.
//  Copyright © 2018 Valentin Nacharov. All rights reserved.
//

import Foundation
import UIKit
import Regift
import SwiftyGif

extension UIViewController
{
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        let tapToHideSlideView: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.hideMenu))
        view.addGestureRecognizer(tap)
        view.addGestureRecognizer(tapToHideSlideView)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
    
    func setSlideView()
    {
        SlideMenuHandler.slideMenu = self.storyboard?.instantiateViewController(withIdentifier: "MenuVC") as! MenuViewController
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeRight.direction = .right
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.handleSwipe))
        swipeLeft.direction = .left
        
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func handleSwipe(gesture: UISwipeGestureRecognizer) {
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
            SlideMenuHandler.slideMenu?.view.frame = CGRect(x: 60, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.addChildViewController(SlideMenuHandler.slideMenu!)
            self.view.addSubview((SlideMenuHandler.slideMenu?.view)!)
            AppDelegate.isMenuVC = false
        }
    }
    
    @objc func hideMenu() {
        UIView.animate(withDuration: 0.3, animations: {
            SlideMenuHandler.slideMenu?.view.frame = CGRect(x: UIScreen.main.bounds.size.width, y: 0, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            SlideMenuHandler.slideMenu?.view.removeFromSuperview()
            AppDelegate.isMenuVC = true
        }
    }
}

extension RecipeStepsAddViewController: SNVideoRecorderDelegate {
    
    func videoRecorder(withVideo url: URL) {
        print(url)
        print("SADSADSASDASDASDASDASDASDASDSASDADSA")
        UrlVideoHandler.urlOfVideo = url
        let frameCount = 24
        let delayTime  = Float(0.05)
        let loopCount  = 0
        UrlVideoHandler.regiftImege = Regift(sourceFileURL: UrlVideoHandler.urlOfVideo, frameCount: frameCount, delayTime: delayTime, loopCount: loopCount)
        UrlVideoHandler.setGifToImage()
        
    }
    
    func videoRecorder(withImage image: UIImage) {
        print(image)
    }
}


