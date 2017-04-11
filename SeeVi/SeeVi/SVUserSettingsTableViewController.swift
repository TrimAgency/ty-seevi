//
//  SVUserSettingsViewController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit

class SVUserSettingsTableViewController: UITableViewController {
    
    // MARK: - View assets
    var closeButton = UIBarButtonItem()
    var saveButton = UIBarButtonItem()
    var editSettingViewController = SVEditUserViewController()
    var paymentsViewController = SVPaymentsViewController()
    var postCell = SVProfileSettingsCell()
    
    //MARK : - View data
    var infoTitles = ["Full name", "E-mail"]
    var infoValues = ["Ty Daniels", "ty@ty.com"]
    
    var passTitle = ["Current password"]
    var passValues = ["12345667"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //Link unique reuse-identifiers
        tableView.register(SVProfileUserCell.self, forCellReuseIdentifier: "ProfileCell")
        tableView.register(SVProfileSettingsCell.self, forCellReuseIdentifier: "PostCell")
        
        setupView()
    }
    
    // MARK: - Layout views
    
    fileprivate func setupView() {
        
        // MARK : Additional layouts
        let rightBarButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveChanges))
        navigationItem.rightBarButtonItem = rightBarButton //Right
    }
    
    @objc fileprivate func saveChanges() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //Make viewController updates from SVProfileSettingsCell button
    @objc fileprivate func selectButtonForCell(sender: AnyObject) {
        let buttonPosition = sender.convert(CGPoint.zero, to: self.tableView)
        let button = sender as! UIButton
        
        UIView.animate(withDuration: 0.2, animations: { //Bouncy button animation on eye select/deselect
            button.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            
        }, completion: { _ in
            UIView.animate(withDuration: 2.0,
                           delay: 0,
                           usingSpringWithDamping: 0.2,
                           initialSpringVelocity: 6.0,
                           options: .allowUserInteraction,
                           animations: { [] in
                            button.transform = .identity
            }, completion: nil)
        })
        
        if let index = self.tableView.indexPathForRow(at: buttonPosition)?.row {
            processButtonSelection(index: index)
        }
    }
    
    fileprivate func processButtonSelection(index: Int) {
        //        users[index].WasSelected = !users[index].WasSelected
        
    }
    
    // MARK: - Controller protocols
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return infoTitles.count
        case 2:
            return 2
        case 5:
            return 1
        default:
            break
        }
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let profileCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as! SVProfileUserCell
        postCell = tableView.dequeueReusableCell(withIdentifier: "PostCell") as! SVProfileSettingsCell
        
        switch indexPath.section {
        case 0:
            profileCell.isEditingProfile = true //Set bool to modify profile cell layout for settings
            return profileCell
        case 1:
            postCell.descriptionLabel.text = infoTitles[indexPath.row]
            postCell.userValLabel.text = infoValues[indexPath.row]
            postCell.accessoryType = .disclosureIndicator
            return postCell
        case 2:
            if indexPath.row == 0 {
                postCell.descriptionLabel.text = passTitle[indexPath.row]
                postCell.userValLabel.text = passValues[indexPath.row]
                postCell.isPass = true
                postCell.viewPassBtn.tag = indexPath.row
                postCell.viewPassBtn.addTarget(self, action: #selector(selectButtonForCell(sender:)), for: .touchUpInside)
                postCell.separatorInset = UIEdgeInsetsMake(0, view.bounds.width/2.0, 0, view.bounds.width/2.0)
                return postCell
            } else {
                postCell.descriptionLabel.text = "Change password"
                postCell.accessoryType = .disclosureIndicator
                return postCell
            }
        case 5:
            postCell.descriptionLabel.text = "Payment methods"
            postCell.accessoryType = .disclosureIndicator
            return postCell
        default:
            break
        }
        
        return UITableViewCell() //Defaults to standard uninitialized cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // No transition for section 0
        guard indexPath.section != 0 else {
            return
        }
        
        // Prep cell data to pass to edit viewcontroller
        let index = tableView.indexPathForSelectedRow
        let currentCell = tableView.cellForRow(at: index!) as! SVProfileSettingsCell
        let titleToPass = currentCell.descriptionLabel.text
        let valueToPass = currentCell.userValLabel.text
        
        //Set var values for the settings detailview
        editSettingViewController.editingLabel.text = titleToPass
        editSettingViewController.editTextField.text = valueToPass
        
        //Trigger transition to edit viewcontroller for cells with indicators
        switch indexPath.section {
        case 2:
            if indexPath.row == 0 {
                break
            } else {
                navigationController?.pushViewController(editSettingViewController, animated: true)
            }
        case 5:
            navigationController?.pushViewController(paymentsViewController, animated: true)
        default:
            navigationController?.pushViewController(editSettingViewController, animated: true)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cellConstant = view.frame.height / 12
        
        switch indexPath.section {
        case 0:
            return view.frame.height / 3
        default:
            return cellConstant
        }
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 1:
            return "User information"
        case 2:
            return "User security"
        case 3:
            return "Tags"
        case 4:
            return "Description"
        case 5:
            return "Billing"
        default:
            return nil
        }
    }
    
    override func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        if let headerView = view as? UITableViewHeaderFooterView {
            headerView.backgroundView?.backgroundColor = UIColor.groupTableViewBackground
            headerView.textLabel?.textColor = UIColor.svBrightLightBlue
            headerView.textLabel?.font = UIFont.systemFont(ofSize: 22)
            headerView.textLabel?.backgroundColor = UIColor.clear
        }
    }

}
