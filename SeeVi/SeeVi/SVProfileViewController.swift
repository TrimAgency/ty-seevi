//
//  SVProfileViewController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SVProfileViewController: UITableViewController {
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SVProfileUserCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
    }
    
    /*
     Setup views/containers. Using Stevia to configure layouts: a framework that is practical due to
     a more visually intuitive syntax. The basic usage of this framework involves setting a top constraint
     for every asset that is vertically aligned. Also, Stevia allows for positioning view objects horizontally
     aligned, and the sizes of each element become relative to one another based on percentages in relation to UIWindow sizes.
     Finally, |-asset-| spans the window with a small margin left/right. ~ is used to set an approximate
     height relative to window height.
     
     In order to use Stevia:
     - 1. Add subviews to corresponding views w/ UIView.sv(views)
     - 2. Layout views within the top view with UIView.layout()
     */
    
    fileprivate func setupView() {
        view.layout(
            100,
            tableView
        )
        
        // MARK: Additional layouts
        
        self.tableView.backgroundColor = UIColor.white
    }
    
    // MARK: - Present user settings
    
    func showSettings() {
        let settingsViewController = SVUserSettingsTableViewController()
        let settingsNavController = UINavigationController(rootViewController: settingsViewController)
        self.present(settingsNavController, animated: true, completion: nil)
    }
    
    // MARK: - Controller protocols
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch section {
        case 0:
            return 1
        case 1:
            return 10
        default:
            break
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! SVProfileUserCell
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell")! as UITableViewCell
        switch indexPath.section {
        case 0:
            profileCell.settingsButton.addTarget(self, action: #selector(showSettings), for: .touchUpInside)
            return profileCell
        case 1:
            return postCell
        default:
            break
        }
        
        return UITableViewCell() //Defaults to standard uninitialized cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return view.frame.height / 3
        case 1:
            return view.frame.height / 6
        default:
            break
        }
        
        return 0
    }
    
}
