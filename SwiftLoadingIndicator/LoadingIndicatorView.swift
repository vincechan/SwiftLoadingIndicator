//
//  LoadingIndicatorView.swift
//  SwiftLoadingIndicator
//
//  Created by Vince Chan on 12/2/15.
//  Copyright © 2015 Vince Chan. All rights reserved.
//
import UIKit

class LoadingIndicatorView {
    
    static var currentOverlay : UIView?
    
    static func show(window: UIWindow) {
        guard let currentMainWindow = UIApplication.shared().keyWindow else {
            print("No main window.")
            return
        }
        show(window: currentMainWindow)
    }
    
    static func show(loadingText: String) {
        guard let currentMainWindow = UIApplication.shared().keyWindow else {
            print("No main window.")
            return
        }
        show(overlayTarget: currentMainWindow, loadingText: loadingText)
    }
    
    static func show(overlayTarget : UIView) {
        show(overlayTarget: overlayTarget, loadingText: nil)
    }
    
    static func show(overlayTarget : UIView, loadingText: String?) {
        // Clear it first in case it was already shown
        hide()
        
        // Create the overlay
        let overlay = UIView(frame: overlayTarget.frame)
        overlay.center = overlayTarget.center
        overlay.alpha = 0
        overlay.backgroundColor = UIColor.black()
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubview(toFront: overlay)
        
        // Create and animate the activity indicator
        let indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        indicator.center = overlay.center
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString
            label.textColor = UIColor.white()
            label.sizeToFit()
            label.center = CGPoint(x: indicator.center.x, y: indicator.center.y + 30)
            overlay.addSubview(label)
        }
        
        // Animate the overlay to show
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.5)
        overlay.alpha = overlay.alpha > 0 ? 0 : 0.5
        UIView.commitAnimations()
        
        currentOverlay = overlay
    }
    
    static func hide() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
        }
    }
}
