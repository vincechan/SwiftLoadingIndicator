//
//  LoadingIndicatorView.swift
//  SwiftLoadingIndicator
//
//  Created by Vince Chan on 12/2/15.
//  Copyright © 2015 Vince Chan. All rights reserved.
//
import UIKit

class LoadingIndicatorView {
    
    static var overlay : UIView?
    
    static func show(viewToOverlayOn : UIView) {
        // Create the overlay
        overlay = UIView(frame: viewToOverlayOn.frame)
        overlay!.center = viewToOverlayOn.center
        overlay!.alpha = 0
        overlay!.backgroundColor = UIColor.blackColor()
        viewToOverlayOn.addSubview(overlay!)
        viewToOverlayOn.bringSubviewToFront(overlay!)
        
        // Create the activity indicator
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.White)
        indicator.center = overlay!.center
        indicator.startAnimating()
        overlay!.addSubview(indicator)
        
        // Animate the overlay to show
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay!.alpha = overlay!.alpha > 0 ? 0 : 0.5
        UIView.commitAnimations()
    }
    
    static func hide() {
        if overlay != nil {
            overlay?.removeFromSuperview()
            overlay =  nil
        }
    }
}