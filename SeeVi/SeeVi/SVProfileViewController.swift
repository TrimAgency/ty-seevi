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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SVProfileUserCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
    }
    
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
