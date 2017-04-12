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
    
    let users = AppDelegate().myUser
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(SVProfileUserCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "PostCell")
        
        //Add user data on load if Realm collection is empty
        if users.count == 0 {
            seedUser()
        }
    }
    
    fileprivate func setupView() {
        view.layout(
            100,
            tableView
        )
        
        // MARK: Additional layouts
        
        self.tableView.backgroundColor = UIColor.white
    }
    
    // MARK: - Add spoofed user settings data
    fileprivate func seedUser() {
        let realmManager = AppDelegate().realm
        let thisUser = SVUser()
        
        //User data
        let imageData = UIImagePNGRepresentation(UIImage(named: "spoofed-image")!)! as NSData
        thisUser.profileImg = imageData
        thisUser.name = "John Doe"
        thisUser.email = "Things@stuff.com"
        thisUser.passWord = "supersecret"
        thisUser.userDescription = "Seevi is literally my favorite app. Also, I like coffee."
        
        //Card data
        let method = SVPaymentMethod()
        for _ in 0...1 {
            method.cardNam = "Ty Monkey"
            method.cardNumber = "0000 0000 0000 0000"
            method.cardDate = "02/12"
            method.cvvNum = "234"
            
//            thisUser.payMethods[0] = method
        }
        
        try! realmManager.write {() -> Void in
            realmManager.add(thisUser)
        }
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
