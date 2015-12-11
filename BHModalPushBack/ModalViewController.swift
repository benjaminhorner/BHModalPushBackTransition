//
//  ModalViewController.swift
//  BHModalPushBack
//
//  Created by Benjamin Horner on 10/12/2015.
//  Copyright © 2015 Qanda. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func buttonTouchUpInside(sender: AnyObject) {
        
        self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
        
    }
}
