//
//  ViewController.swift
//  SwiftLoadingIndicator
//
//  Created by Vince Chan on 12/2/15.
//  Copyright © 2015 Vince Chan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func launchButtonTouched(sender: AnyObject) {
        LoadingIndicatorView.show(view)
        
        // simulate time consuming work
        NSTimer.scheduledTimerWithTimeInterval(4, target: self, selector: "doWork", userInfo: nil, repeats: false)
    }
    
    func doWork() {
        // dismiss the loading indicator view once work is done
        LoadingIndicatorView.hide()
    }
}

