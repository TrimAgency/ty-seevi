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
        
        setupTabs()
        drawMiddleButton()
    }
    
    // MARK: - Sets up TabBarController indexes/views
    
    fileprivate func setupTabs() {
        let svFeedViewController = SeeViMainFeedViewController()
        let placeHolderVC1 = UIViewController()
        let placeHolderVC2 = UIViewController()
        let placeHolderVC3 = UIViewController()
        let placeHolderVC4 = UIViewController()
        
        //Configure viewcontrollers in tabbarcontroller
        placeHolderVC1.tabBarItem = UITabBarItem(title: "Home", image: nil, tag: 0)
        placeHolderVC2.tabBarItem = UITabBarItem(title: "Search", image: nil, tag: 1)
        svFeedViewController.tabBarItem = UITabBarItem(title: "Add", image: nil, tag: 2)
        placeHolderVC3.tabBarItem = UITabBarItem(title: "Notifs", image: nil, tag: 3)
        placeHolderVC4.tabBarItem = UITabBarItem(title: "User", image: nil, tag: 4)
        //Add viewcontrollers
        self.setViewControllers([placeHolderVC1, placeHolderVC2, svFeedViewController, placeHolderVC3, placeHolderVC4], animated: true)
        self.selectedIndex = 2
        
        self.delegate = self
    }
}

// MARK: UITabBarController protocols

extension MainTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool{
        
        let fromView: UIView = tabBarController.selectedViewController!.view
        let toView  : UIView = viewController.view
        if fromView == toView {
            return false
        }
        
        //Custom transition animation on tab selection
        UIView.transition(from: fromView,
                          to: toView,
                          duration: 0.3,
                          options: UIViewAnimationOptions.transitionCrossDissolve) { (finished:Bool) in
        }
        
        return true
    }
    
    // MARK: - Configure custom center button
    fileprivate func drawMiddleButton() {
        let menuButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
    
        var menuButtonFrame = menuButton.frame
        menuButtonFrame.origin.y = view.bounds.height - menuButtonFrame.height
        menuButtonFrame.origin.x = view.bounds.width/2 - menuButtonFrame.size.width/2
        menuButton.frame = menuButtonFrame
        menuButton.backgroundColor = UIColor.white
        menuButton.layer.cornerRadius = menuButtonFrame.height/2
        menuButton.setImage(UIImage(named: "plus"), for: .normal)
        menuButton.addTarget(self, action: #selector(menuButtonAction(sender:)), for: .touchUpInside)
    
        view.addSubview(menuButton)
        view.layoutIfNeeded()
    }
    
    // Menu Button Touch Action
    func menuButtonAction(sender: UIButton) {
        self.selectedIndex = 2
    }
}
