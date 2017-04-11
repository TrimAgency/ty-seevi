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
    var bankObject: SVPaymentMethod? {
        didSet {
            if let obj = bankObject { // If bankObject !nil, initialize the view w/ it's values
                numberLabel.text = obj.cardNumber
                dateValLabel.text = obj.cardDate
                codeValLabel.text = obj.cvvNum
                nameLabel.text = obj.cardNam
            }
        }
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    // MARK: - View layout
    fileprivate func setupView() {
        let rowHeightConstant = contentView.frame.height / 3
        let rowWidthConstant = contentView.frame.width / 3
        let leftSideFont = UIFont.boldSystemFont(ofSize: 17)
        let rightSideFont = UIFont.systemFont(ofSize: 18)
        
        let textColorConstant = UIColor.groupTableViewBackground
        
        contentView.sv(numberDescLabel, numberLabel,
                       dateDescLabel, dateValLabel, cardDescLabel, codeValLabel,
                       cardHolderDescLabel, nameLabel)
        contentView.layout(
            0,
            |-numberDescLabel-numberLabel-| ~ rowHeightConstant,
            0,
            |-dateDescLabel-dateValLabel-cardDescLabel-codeValLabel-| ~ rowHeightConstant,
            0,
            |-cardHolderDescLabel-nameLabel-| ~ rowHeightConstant
        )
        
        // MARK: - Additional layout
        contentView.backgroundColor = UIColor.svDarkBlue
        
        numberDescLabel.text = "Card number"
        numberDescLabel.textColor = textColorConstant
        numberDescLabel.font = leftSideFont
        
        numberLabel.textAlignment = .right
        numberLabel.textColor = textColorConstant
        numberLabel.font = rightSideFont
        
        dateDescLabel.text = "Expiration date"
        dateDescLabel.textColor = textColorConstant
        dateDescLabel.font = leftSideFont
        dateDescLabel.width(rowWidthConstant)
        
        dateValLabel.width(60)
        dateValLabel.textColor = textColorConstant
        dateValLabel.font = rightSideFont
        
        cardDescLabel.text = "CVV"
        cardDescLabel.textColor = textColorConstant
        cardDescLabel.font = leftSideFont
        
        codeValLabel.textAlignment = .right
        codeValLabel.textColor = textColorConstant
        codeValLabel.font = rightSideFont
        
        cardHolderDescLabel.text = "Cardholder name"
        cardHolderDescLabel.textColor = textColorConstant
        cardHolderDescLabel.font = leftSideFont
        
        nameLabel.textAlignment = .right
        nameLabel.textColor = textColorConstant
        nameLabel.font = rightSideFont
    }
}
