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
    var payMethods = [SVPaymentMethod]() {
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
        seedJunkData()
    }
    
    fileprivate func setupView() {
        view.sv(payMethodsTable, addCardButton)
        view.layout(
            0,
            |payMethodsTable| ~ view.frame.height / 1.5,
            0,
            |addCardButton| ~ view.frame.height / 8
        )
        
        // MARK: - Additional layouts
        
        self.title = "Billing"
        
        view.backgroundColor = UIColor.groupTableViewBackground
        
        payMethodsTable.backgroundColor = UIColor.darkGray
        payMethodsTable.separatorStyle = .none
        
        addCardButton.setTitle("Add Card", for: .normal)
        addCardButton.backgroundColor = UIColor.lightGray
    }
    
    //Add fake card data
    fileprivate func seedJunkData() {
        var emptyObjs = [SVPaymentMethod]()
        var method = SVPaymentMethod()
        
        for _ in 0...1 {
            method.cardNam = "Ty Monkey"
            method.cardNumber = "0000 0000 0000 0000"
            method.cardDate = "02/12"
            method.cvvNum = "234"
            
            emptyObjs.append(method)
        }
        payMethods = emptyObjs
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
        
        if !payMethods.isEmpty {                       // Verify a filled payment collection
            cell.bankObject = payMethods[indexPath.row]
        }
        return cell
    }
}


