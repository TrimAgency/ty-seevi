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
        
        view.backgroundColor = UIColor.white
        
        editingLabel.text = "Edit"
        editingLabel.textAlignment = .center
        
        editTextField.placeholder = "Add new information..."
        editTextField.textAlignment = .center
        editTextField.centerVertically()
    }
}
