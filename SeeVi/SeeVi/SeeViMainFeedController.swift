//
//  SeeViMainFeedController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import GoogleMaps
import Stevia

class SeeViMainFeedViewController: UIViewController {
    
    // MARK: - Views
    var googleMap = GMSMapView()
    
    // MARK: - Network managers
    let cllocationManager = CLLocationManager()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Request location authorization
        self.cllocationManager.requestAlwaysAuthorization()
        self.cllocationManager.requestWhenInUseAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            cllocationManager.desiredAccuracy = kCLLocationAccuracyBest
            cllocationManager.startUpdatingLocation()
        }
        
        setupView()
    }
    
    /*
     Setup views/containers. Using Stevia to configure layouts: a framework that is practical due to
     a more visually intuitive syntax. The basic usage of this framework involves setting a top constraint
     for every asset that is vertically aligned. Also, Stevia allows for positioning view objects horizontally
     aligned, and the sizes of each element become relative to one another based on percentages in relation to
     UIWindow sizes.
     
     Finally, |-asset-| spans the window with a small margin left/right. ~ is used to set an approximate
     height relative to window height.
     
     Steps to use Stevia:
    - 1. Add subviews to corresponding views w/ UIView.sv(views)
    - 2. Layout views within the top view with UIView.layout()
    */
    fileprivate func setupView() {
        view.sv(googleMap)
        view.layout(
            0,
            |googleMap| ~ view.frame.height
        )
        
        // MARK: - Additional layouts
        view.backgroundColor = UIColor.white
    }
}
