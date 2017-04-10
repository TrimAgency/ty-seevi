//
//  MainTabBarController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController {
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabController()
    }
    
    // MARK: - Sets up TabBarController indexes/views
    fileprivate func setupTabController() {
        let svFeedViewController = SeeViMainFeedViewController()
        let placeHolderVC1 = UIViewController()
        let placeHolderVC2 = UIViewController()
        let placeHolderVC3 = UIViewController()
        let placeHolderVC4 = UIViewController()
        
        placeHolderVC1.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        placeHolderVC2.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 1)
        svFeedViewController.tabBarItem = UITabBarItem(title: "Add", image: nil, tag: 2)
        placeHolderVC3.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 3)
        placeHolderVC4.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 4)
        
        self.setViewControllers([placeHolderVC1, placeHolderVC2, svFeedViewController, placeHolderVC3, placeHolderVC4], animated: true)
        self.selectedIndex = 2
    }
}
