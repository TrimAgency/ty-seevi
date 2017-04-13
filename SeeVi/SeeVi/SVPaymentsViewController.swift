//
//  SVPaymentsViewController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/11/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SVPaymentsViewController: UIViewController {
    
    //MARK: - Payments controllers
    
    var payMethodsTable = UITableView()
    var addCardButton = UIButton()
    
    //MARK: - View data
    
    var payMethods = AppDelegate().paymentMethods {
        didSet {
            payMethodsTable.reloadData()
        }
    }
    
    // MARK: - View assets
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payMethodsTable.delegate = self
        payMethodsTable.dataSource = self
        payMethodsTable.register(SVPaymentMethodCell.self, forCellReuseIdentifier: "PaymentCell")
        
        setupView()
    }
    
    /*
     Setup views/containers. Using Stevia to configure layouts: a framework that is practical due to
     a more visually intuitive syntax. The basic usage of this framework involves setting a top constraint
     for every asset that is vertically aligned. Also, Stevia allows for positioning view objects horizontally
     aligned, and the sizes of each element become relative to one another based on percentages in relation to UIWindow sizes.
     Finally, |-asset-| spans the window with a small margin left/right. ~ is used to set an approximate
     height relative to window height.
     
     In order to use Stevia:
     - 1. Add subviews to corresponding views w/ UIView.sv(views)
     - 2. Layout views within the top view with UIView.layout()
     */
    fileprivate func setupView() {
        let buttonConstant = view.frame.height / 10
        
        view.sv(payMethodsTable, addCardButton)
        view.layout(
            0,
            |payMethodsTable| ~ view.frame.height  - buttonConstant - 10, //Creates top space for the UIButton
            0,
            |-addCardButton-| ~ buttonConstant
        )
        
        // MARK: - Additional layouts
        
        self.title = "Billing"
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        payMethodsTable.backgroundColor = UIColor.groupTableViewBackground
        payMethodsTable.separatorStyle = .none
        
        let addCardAttrText = NSAttributedString(string: "Add an Account",
                                                     attributes: [NSForegroundColorAttributeName : UIColor.white,
                                                                  NSFontAttributeName: UIFont.svTextStyle3Font()!])
        addCardButton.setAttributedTitle(addCardAttrText, for: .normal)
        addCardButton.backgroundColor = UIColor.svDarkBlue
        addCardButton.layer.cornerRadius = 10
    }
}

// MARK: - Controller protocols

extension SVPaymentsViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.height / 4
    }
}

extension SVPaymentsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return payMethods.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell") as! SVPaymentMethodCell
        
        if !(payMethods.isEmpty) {                       // Verify a filled payment collection
            cell.bankObject = payMethods[indexPath.row]
        }
        return cell
    }
}


