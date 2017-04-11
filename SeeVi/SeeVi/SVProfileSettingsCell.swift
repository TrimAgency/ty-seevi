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
    
    func setupView() {
        contentView.sv(descriptionLabel, userValLabel)
        contentView.layout(
            0,
            |-descriptionLabel-userValLabel-| ~ contentView.frame.height
        )
        
        // MARK: - Additional layouts
        contentView.backgroundColor = UIColor.white
        
        descriptionLabel.textColor = UIColor.black
        descriptionLabel.font = UIFont.systemFont(ofSize: 22)
        
        userValLabel.textColor = UIColor.lightGray
        userValLabel.font = UIFont.systemFont(ofSize: 22)
        userValLabel.textAlignment = .right
    }
}
