//
//  SVUser.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/12/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import RealmSwift

// MARK : User Realm object
class SVUser: Object {
    dynamic var name: String? = ""
    dynamic var profileImg: NSData? = NSData()
    dynamic var email: String? = ""
    dynamic var passWord: String? = ""
    dynamic var userDescription: String? = ""
    dynamic var isPassShowing: Bool = false
}
