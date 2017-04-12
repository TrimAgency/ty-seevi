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
        
    }
}
