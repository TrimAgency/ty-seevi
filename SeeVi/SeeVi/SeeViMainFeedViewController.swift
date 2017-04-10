//
//  SeeViMainFeedViewController.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit
import Stevia

class SeeViMainFeedViewController: UIViewController {
    
    // MARK : - View assets
    var localityFeedTable = UITableView()
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        localityFeedTable.delegate = self
        localityFeedTable.register(UITableViewCell.self, forCellReuseIdentifier: "FeedCell")
        
        setupView()
    }
    
    fileprivate func setupView() {
        view.sv(localityFeedTable)
        view.layout(
            0,
            |localityFeedTable| ~ view.frame.height
        )
        
        // MARK: - Additional layouts
        view.backgroundColor = UIColor.white
    }
}

extension SeeViMainFeedViewController : UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let feedCell = tableView.dequeueReusableCell(withIdentifier: "FeedCell")! as UITableViewCell
        return feedCell
    }
}

extension SeeViMainFeedViewController : UITableViewDelegate {
    
}
