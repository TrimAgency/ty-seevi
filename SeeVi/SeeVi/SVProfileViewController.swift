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
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "ProfileCell")
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
    }
    
    fileprivate func setupView() {
        self.tableView.backgroundColor = UIColor.white
    }
    
    // MARK: - Controller protocols
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell")! as UITableViewCell
        let postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell")! as UITableViewCell
        switch indexPath.section {
            case 0:
                return profileCell
            case 1:
                return postCell
            default:
                break
        }
        
        return UITableViewCell() //Defaults to standard uninitialized cell
    }
}
