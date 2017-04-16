//
//  SVEditUserViewController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/11/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

protocol EditSettingDelegate {
    func updateSettings()
}

class SVEditUserViewController: UIViewController {
    
    // MARK: - View assets
    var editingLabel = UILabel()
    var editTextField = UITextField()
    var doneButton = UIBarButtonItem()
    
    // MARK: - View data
    let thisUser = AppDelegate().myUser[0]
    var settingsDelegate: EditSettingDelegate?
    
    // MARK: - Realm manager
    let realmManager = AppDelegate().realm
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        editTextField.becomeFirstResponder()
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
        view.sv(editingLabel, editTextField)
        view.layout(
            0,
            |-editingLabel-| ~ view.frame.height / 6,
            0,
            |-editTextField-| ~ view.frame.height / 6
        )
        
        // MARK: Additional layouts
        
        self.title = "Edit Profile"
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(saveChanges))
        navigationItem.rightBarButtonItem = doneButton
        
        view.backgroundColor = UIColor.groupTableViewBackground

        editingLabel.font = UIFont.svTextStyle2Font()
        editingLabel.textColor = UIColor.svWarmGrey
        editingLabel.textAlignment = .center
        
        editTextField.placeholder = "Add new profile info..."
        editTextField.textColor = UIColor.svDarkBlue
        editTextField.font = UIFont.svTextStyle3Font()
        editTextField.textAlignment = .center
        editTextField.centerVertically()
    }
    
    @objc fileprivate func saveChanges() {
        let updateUser = realmManager.objects(SVUser.self).first
        
        if let updateVal = editTextField.text {
            switch editingLabel.text! {
            case "Full name":
                try! realmManager.write {
                    updateUser?.name = updateVal
                }
            case "E-mail":
                try! realmManager.write {
                    updateUser?.email = updateVal
                }
            case "Change password":
                try! realmManager.write {
                    updateUser?.passWord = updateVal
                }
            default:
                break
            }
            
            navigationController?.popToRootViewController(animated: true)
            settingsDelegate?.updateSettings() //Trigger reload in parent viewcontroller
        }
    }
}
