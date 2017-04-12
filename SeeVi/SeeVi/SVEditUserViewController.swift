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

class SVEditUserViewController: UIViewController {
    
    // MARK: - View assets
    var editingLabel = UILabel()
    var editTextField = UITextField()
    var doneButton = UIBarButtonItem()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
        editTextField.becomeFirstResponder()
    }
    
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
        
        view.backgroundColor = UIColor.white

        editingLabel.font = UIFont.boldSystemFont(ofSize: 28)
        editingLabel.textColor = UIColor.svWarmGrey
        editingLabel.textAlignment = .center
        
        editTextField.placeholder = "Add new profile info..."
        editTextField.font = UIFont.systemFont(ofSize: 22)
        editTextField.textAlignment = .center
        editTextField.centerVertically()
    }
    
    @objc fileprivate func saveChanges() {
       navigationController?.popToRootViewController(animated: true)
    }
}
