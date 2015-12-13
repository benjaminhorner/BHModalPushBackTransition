//
//  ViewController.swift
//  BHModalPushBack
//
//  Created by Benjamin Horner on 10/12/2015.
//  Copyright © 2015 Qanda. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIViewControllerTransitioningDelegate {
    

    let transition = BHModalPushBackTransition()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    
    // Delegates
    func animationControllerForPresentedController(
        presented: UIViewController,
        presentingController presenting: UIViewController,
        sourceController source: UIViewController) ->
        UIViewControllerAnimatedTransitioning? {
            
            
//            transition.originFrame =
//                selectedImage!.superview!.convertRect(selectedImage!.frame, toView: nil)
            
            transition.presenting = true
            
            return transition
    }
    
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.presenting = false
        
        return transition
    }

    @IBAction func buttonTouchUpInside(sender: AnyObject) {
        
        //present details view controller
        let details = storyboard!.instantiateViewControllerWithIdentifier("modalVC") as! ModalViewController
        details.transitioningDelegate = self
        details.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(details, animated: true, completion: nil)
        
    }
    
}

