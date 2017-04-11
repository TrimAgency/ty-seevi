//
//  PaymentMethodCell.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/11/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SVPaymentMethodCell: UITableViewCell {
    
    // MARK: View assets
    
    var numberDescLabel = UILabel() //First 'row'
    var numberLabel = UILabel()
    
    var dateDescLabel = UILabel() //Second 'row'
    var dateValLabel = UILabel()
    var cardDescLabel = UILabel()
    var codeValLabel = UILabel()
    
    var cardHolderDescLabel = UILabel() //Third 'row'
    var nameLabel = UILabel()
    
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
        let rowHeightConstant = contentView.frame.height
        
        contentView.sv(numberDescLabel, numberLabel,
                       dateDescLabel, dateValLabel, cardDescLabel, codeValLabel,
                       cardHolderDescLabel, nameLabel)
        contentView.layout(
            0,
            |-numberDescLabel-numberLabel-| ~ rowHeightConstant,
            0,
            |-dateDescLabel-dateValLabel-(20)-cardDescLabel-codeValLabel-| ~ rowHeightConstant,
            0,
            |-cardHolderDescLabel-nameLabel-| ~ rowHeightConstant
        )
        
        // MARK: - Additional layout
        
        contentView.backgroundColor = UIColor.svDarkBlue
        
        numberDescLabel.text = "Card number"
        
        dateDescLabel.text = "Expiration date"
        
        cardDescLabel.text = "CVV"
        
        cardHolderDescLabel.text = "Cardholder name"
    }
}
