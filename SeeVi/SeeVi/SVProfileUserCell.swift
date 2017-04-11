//
//  SVProfileUserCell.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage
import Stevia

class SVProfileUserCell: UITableViewCell {
    
    //MARK: View assets
    
    var mainBackgroundView = UIView()
    var avatar = UIImageView(image: UIImage(named: "user-placeholder"))
    var tappableName = UILabel()
    var settingsButton = UIButton()
    var selectBtn = UIButton()
    
    //MARK: Reused view data
    var avatarString: String? = ""
    var name: String? = ""
    var isEditingProfile: Bool = false
    
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
        
        contentView.sv(mainBackgroundView)
        contentView.layout(
            0,
            |-mainBackgroundView-| ~ self.contentView.frame.height
        )
        
        mainBackgroundView.sv(avatar, tappableName, selectBtn, settingsButton)
        mainBackgroundView.layout(
            (contentView.frame.height / 4), //Set very top margin based on contentview frame height
            avatar,
            10,
            |-tappableName-| ~ contentView.frame.height / 8,
            0,
            |-settingsButton-| ~ contentView.frame.height / 8
            
        )
        
        //MARK: - Additional cell layouts
        
        mainBackgroundView.backgroundColor = UIColor.white
        
        avatar.height(80)
        avatar.width(80)
        avatar.backgroundColor = UIColor.lightGray
        avatar.layer.cornerRadius = 40
        avatar.layer.shadowColor = UIColor.black.cgColor
        avatar.layer.shadowOpacity = 1
        avatar.layer.shadowOffset = .zero
        avatar.layer.shadowRadius = 10
        avatar.centerHorizontally()
        
        tappableName.height(20)
        tappableName.top(-10)
        tappableName.font = UIFont.boldSystemFont(ofSize: 22)
        tappableName.backgroundColor = UIColor.clear
        tappableName.textColor = UIColor.black
        tappableName.textAlignment = .center
        tappableName.text = "Ty Daniels"
        
        //Setup edit profile button
        var editProfileAttrText = NSAttributedString(string: "Edit Profile", attributes: [NSForegroundColorAttributeName : UIColor.svBrightLightBlue])
        
        if isEditingProfile {
            tappableName.frame = .zero
            tappableName.isHidden = true
            editProfileAttrText = NSAttributedString(string: "Update Image", attributes: [NSForegroundColorAttributeName : UIColor.svBrightLightBlue])
        }
        
        settingsButton.setAttributedTitle(editProfileAttrText, for: .normal)
    }
    
    // MARK: - Clear data for reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        tappableName.text = ""
        avatar.image = nil
        avatar.isHidden = false
        avatar.sd_cancelCurrentImageLoad()
    }
}
