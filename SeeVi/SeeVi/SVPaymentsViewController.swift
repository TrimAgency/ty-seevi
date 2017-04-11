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
    
    // MARK: - View assets
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        payMethodsTable.register(UITableViewCell.self, forCellReuseIdentifier: "PaymentCell")
        
        setupView()
    }
    
    fileprivate func setupView() {
        
        view.sv(payMethodsTable)
        view.layout(
            0,
            |payMethodsTable| ~ view.frame.height / 1.5
        )
        
        view.backgroundColor = UIColor.svDarkBlue
    }
}

extension SVPaymentsViewController : UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentCell")! as UITableViewCell
        return cell
    }
}
