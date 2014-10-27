//
//  ViewController.swift
//  ChangeBackgroundWithSwift
//
//  Created by Jorge Casariego on 27/10/14.
//  Copyright (c) 2014 Jorge Casariego. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var imageView:UIImageView = UIImageView()
    var backgroundDictionary:Dictionary<String, String> = Dictionary()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let width:CGFloat = 320;
        let height:CGFloat = 568;
        
        
        backgroundDictionary = ["Background1":"background1", "Background2":"background2"]
        
        var buttonTitles = ["Background 1", "Background 2"]
        
        var view:UIView = UIView(frame: CGRectMake(0, 0, width, height))
        
        self.view.addSubview(view);
        
        var backgroundImage:UIImage = UIImage(named: backgroundDictionary["Background1"]!)!
        
        imageView = UIImageView(frame: view.frame)
        
        imageView.image = backgroundImage
        
        view.addSubview(imageView)
        
        for i in 0 ... buttonTitles.count-1{
            var button:UIButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
            button.frame = CGRectMake(0, 0, 200, 20)
            
            button.center = CGPointMake(view.center.x, CGFloat(100+i*50))
            
            button.setTitle(buttonTitles[i], forState: UIControlState.Normal)
            
            button.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
            
            button.addTarget(self, action: "buttonClicked:", forControlEvents: UIControlEvents.TouchUpInside)
            
            button.tag = i + 1
            
            view.addSubview(button)
        }
        
        
    }
    
    func buttonClicked(sender:UIButton!){        
        var button:UIButton = sender
        var imageSelector:String = "Background\(button.tag)"
        
        UIView.animateWithDuration(0.4, animations: {self.imageView.alpha=0}, completion:{_ in
            self.imageView.image = UIImage(named:self.backgroundDictionary[imageSelector]!)
            UIView.animateWithDuration(0.4, animations: {self.imageView.alpha = 1})
        })

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    
        
    }


}

