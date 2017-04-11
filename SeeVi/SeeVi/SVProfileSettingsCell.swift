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
    
    // MARK : Update views based on conditions
    var isPass: Bool = false
    
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
        contentView.sv(descriptionLabel, userValLabel, viewPassBtn)
        contentView.layout(
            0,
            |-descriptionLabel-userValLabel-viewPassBtn-| ~ contentView.frame.height
        )

        // MARK: - Additional layout
        contentView.backgroundColor = UIColor.white

        descriptionLabel.textColor = UIColor.black
        descriptionLabel.font = UIFont.systemFont(ofSize: 22)

        viewPassBtn.width(30)
        viewPassBtn.height(30)
        viewPassBtn.setImage(UIImage(named: "eye"), for: .normal)
        viewPassBtn.isHidden = true

        userValLabel.textColor = UIColor.lightGray
        userValLabel.font = UIFont.systemFont(ofSize: 22)
        userValLabel.textAlignment = .right
        if isPass {
            userValLabel.text = String(repeating: "*", count: (userValLabel.text?.characters.count)!)
            viewPassBtn.isHidden = false
        }
    }
}
