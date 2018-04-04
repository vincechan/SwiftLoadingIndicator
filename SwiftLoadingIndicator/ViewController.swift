
//
//  ViewController.swift
//  SwiftLoadingIndicator
//
//  Created by Vince Chan on 12/2/15.
//  Copyright © 2015 Vince Chan. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func overlayMapButtonTouched(_ sender: AnyObject) {
        LoadingIndicatorView.show(mapView, loadingText: "Loading")
        
        // simulate time consuming work
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.doWork), userInfo: nil, repeats: false)
    }
    
    
    @IBAction func overlayScreenButtonTouched(_ sender: AnyObject) {
        
        LoadingIndicatorView.show("Loading")
        
        // simulate time consuming work
        Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(ViewController.doWork), userInfo: nil, repeats: false)
    }
    
    @objc func doWork() {
        // dismiss the loading indicator view once work is done
        LoadingIndicatorView.hide()
    }
}

