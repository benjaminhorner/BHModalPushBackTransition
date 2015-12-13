//
//  BHModalPushBackTransition.swift
//  BHModalPushBack
//
//  Created by Benjamin Horner on 10/12/2015.
//  Copyright © 2015 Qanda. All rights reserved.
//

import UIKit

class BHModalPushBackTransition: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    let duration = 0.35
    let startSize: CGFloat = 1
    let endSize: CGFloat = 0.95
    let startOpacity: CGFloat = 1
    let endOpacity: CGFloat = 0.65
    let startPosition: CGFloat = UIScreen.mainScreen().bounds.height
    let endPosition: CGFloat = 30
    var presenting: Bool  = true
    
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?)-> NSTimeInterval {
        return duration
    }
    
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        
        let containerView = transitionContext.containerView()!
                
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)
        
        let showingView = presenting ? fromVC!.view : toVC!.view
        let modalView = presenting ? toVC!.view : fromVC!.view
        
        let toView = modalView
        
        let origin = presenting ? startPosition : endPosition
        
        
        let end = presenting ? endPosition : startPosition
        
        
        let xScaleFactorOrigin = presenting ? startSize : endSize
        let yScaleFactorOrigin = presenting ? startSize : endSize
        
        
        let xScaleFactorEnd = presenting ? endSize : startSize
        let yScaleFactorEnd = presenting ? endSize : startSize
        
        
        let scaleTransformOrigin = CGAffineTransformMakeScale(CGFloat(xScaleFactorOrigin), CGFloat(yScaleFactorOrigin))
        
        let scaleTransformEnd = CGAffineTransformMakeScale(CGFloat(xScaleFactorEnd), CGFloat(yScaleFactorEnd))
        
        let opacityOrigin = presenting ? startOpacity : endOpacity
        let opacityEnd = presenting ? endOpacity : startOpacity
        
        showingView.transform = scaleTransformOrigin
        showingView.alpha = opacityOrigin
        
        modalView.frame.origin.y = origin
        
        containerView.addSubview(toView)
        
        toVC?.beginAppearanceTransition(true, animated: true)
        
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            
            modalView.frame.origin.y = end
            showingView.transform = scaleTransformEnd
            showingView.alpha = opacityEnd
            
            }) { (completed) -> Void in
                toVC?.endAppearanceTransition()
                transitionContext.completeTransition(true)
        }
        
        
    }

}
