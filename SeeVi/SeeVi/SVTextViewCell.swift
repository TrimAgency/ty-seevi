//
//  SVTextViewCell.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/12/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SVTextViewCell: UITableViewCell {
    
    // MARK: - View objects
    var containerView = UIView()
    var descriptionTitle = UILabel()
    var descriptionView = UITextView()
    
    //MARK: - Lifecycle
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupView()
    }
    
    //MARK: - Initialization
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    fileprivate func setupView() {
        contentView.sv(containerView)
        contentView.layout(
            5,
            |-containerView-| ~ contentView.frame.height  - 10
        )
        
        containerView.sv(descriptionView)
        containerView.layout(
            5,
            |descriptionView| ~ contentView.frame.height - 10 // Create space at top/bottom of descriptionview shape
        )
        
        self.selectionStyle = .none
        self.accessoryType = .disclosureIndicator
        
        containerView.backgroundColor = UIColor.groupTableViewBackground
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.svBrightLightBlue.cgColor
        containerView.layer.borderWidth = 1
        
        descriptionView.backgroundColor = UIColor.clear
        descriptionView.isUserInteractionEnabled = false
    }
}
