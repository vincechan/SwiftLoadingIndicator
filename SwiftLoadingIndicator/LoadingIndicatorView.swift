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
    static var currentOverlayTarget : UIView?
    static var currentLoadingText: String?
    
    // iOS 13 API Deprecated the .keyWindow
    static var mainWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return UIApplication.shared.windows.first
        } else {
            return UIApplication.shared.keyWindow
        }
    }
    
    static func show() {
        guard let currentMainWindow = mainWindow else {
            print("No main window.")
            return
        }
        show(currentMainWindow)
    }
    
    static func show(_ loadingText: String) {
        guard let currentMainWindow = mainWindow else {
            print("No main window.")
            return
        }
        show(currentMainWindow, loadingText: loadingText)
    }
    
    static func show(_ overlayTarget : UIView) {
        show(overlayTarget, loadingText: nil)
    }
    
    static func show(
        _ overlayTarget : UIView,
        fadeTime: Double = 0.5,
        loadingText: String?,
        backgroundAlpha: Double = 0.5,
        backgroundColor: UIColor = UIColor.black,
        useBlurFx: Bool = false,
        blurStyle: UIBlurEffect.Style = UIBlurEffect.Style.extraLight
    ) {
        // Clear it first in case it was already shown
        hide()
        
        // Create the overlay
        let overlay = UIView()
        overlay.alpha = 0
        
        if useBlurFx {
            overlay.backgroundColor = UIColor.clear
        } else {
            overlay.backgroundColor = backgroundColor.withAlphaComponent(backgroundAlpha)
        }
        
        overlay.translatesAutoresizingMaskIntoConstraints = false
        overlayTarget.addSubview(overlay)
        overlayTarget.bringSubview(toFront: overlay)
        
        overlay.widthAnchor.constraint(equalTo: overlayTarget.widthAnchor).isActive = true
        overlay.heightAnchor.constraint(equalTo: overlayTarget.heightAnchor).isActive = true
        
        // Setup the Blur (if requested)
        if useBlurFx {
            let blurEffect = UIBlurEffect(style: blurStyle)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            blurEffectView.frame = overlay.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            overlay.addSubview(blurEffectView)
        }
        
        // Create and animate the activity indicator
        var indicator: UIActivityIndicatorView;
        if #available(iOS 13.0, *) {
            indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.large)
        } else {
            indicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.white)
        }
        
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.startAnimating()
        overlay.addSubview(indicator)
        
        indicator.centerXAnchor.constraint(equalTo: overlay.centerXAnchor).isActive = true
        indicator.centerYAnchor.constraint(equalTo: overlay.centerYAnchor).isActive = true
        
        // Create label
        if let textString = loadingText {
            let label = UILabel()
            label.text = textString
            label.textColor = UIColor.white
            overlay.addSubview(label)
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: indicator.bottomAnchor, constant: 16).isActive = true
            label.centerXAnchor.constraint(equalTo: indicator.centerXAnchor).isActive = true
        }
        
        // Animate the overlay to show
        /// the opacity is set on the background color not in the alpha
        UIView.animate(withDuration: fadeTime, animations: {
            overlay.alpha = overlay.alpha > 0 ? 0 : 1
        })
        
        currentOverlay = overlay
        currentOverlayTarget = overlayTarget
        currentLoadingText = loadingText
    }
    
    static func hide() {
        if currentOverlay != nil {
            currentOverlay?.removeFromSuperview()
            currentOverlay =  nil
            currentLoadingText = nil
            currentOverlayTarget = nil
        }
    }
}
