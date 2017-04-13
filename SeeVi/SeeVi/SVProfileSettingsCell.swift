//
//  SVProfileSettingsCell.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SVProfileSettingsCell: UITableViewCell {
    
    // MARK: View assets
    var descriptionLabel = UILabel()
    var userValLabel = UILabel()
    var viewPassBtn = UIButton()
    
    // MARK : Update password security view based on bool
    var isPass: Bool = false
    var isPassShown: Bool? {
        didSet {
            if !isPassShown! { // If isPassShown = false, secure the password string.
                userValLabel.text = String(repeating: "*", count: (userValLabel.text?.characters.count) ?? 5)
            }
        }
    }
    
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
        let leftMarginConstant = contentView.frame.width / 20
        
        contentView.sv(descriptionLabel, userValLabel, viewPassBtn)
        contentView.layout(
            0,
            |-leftMarginConstant-descriptionLabel-userValLabel-viewPassBtn-| ~ contentView.frame.height
        )

        // MARK: - Additional layout
        contentView.backgroundColor = UIColor.white

        descriptionLabel.textColor = UIColor.svDarkBlue
        descriptionLabel.font = UIFont.svTextStyle5Font()

        viewPassBtn.width(30)
        viewPassBtn.height(30)
        viewPassBtn.setImage(UIImage(named: "eye"), for: .normal)
        viewPassBtn.isHidden = true

        userValLabel.textColor = UIColor.lightGray
        userValLabel.font = UIFont.svTextStyle5Font()
        userValLabel.textAlignment = .right
        if isPass {
            viewPassBtn.isHidden = false
        }
    }
}
