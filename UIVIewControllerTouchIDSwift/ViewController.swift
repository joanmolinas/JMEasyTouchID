//
//  ViewController.swift
//  UIVIewControllerTouchIDSwift
//
//  Created by Joan Molinas on 20/2/15.
//  Copyright (c) 2015 Joan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        useTouchID("touchID", completion: { (success, messageState, errorResult) -> Void in
            println("error \(errorResult)")
        });
        
        let b = UIButton.buttonWithType(.System) as UIButton
        b.frame = CGRectMake(0, 0, 200, 100)
        b.setTitle("touchID", forState: .Normal)
        b.backgroundColor = UIColor.lightGrayColor()
        b.center = view.center
        b.layer.cornerRadius = 4
        b.titleLabel?.font = b.titleLabel?.font.fontWithSize(25)
        b.tintColor = UIColor.whiteColor()
        b.addTarget(self, action: "checkTouchID:", forControlEvents: .TouchUpInside)
        
        view.addSubview(b)
    }
    
    func checkTouchID(sender: AnyObject) {
        useTouchID("touchID", completion: { (success, messageState, errorResult) -> Void in
            println(messageState)
        });
    }

}

