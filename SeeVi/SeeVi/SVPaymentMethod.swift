//
//  PaymentMethod.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/11/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import RealmSwift

// MARK : Payment Realm object
class SVPaymentMethod: Object {
    dynamic var cardNumber: String? = ""
    dynamic var cardDate: String? = "" //NOTE: This would likely be converted from actual NSDate
    dynamic var cvvNum: String? = ""
    dynamic var cardNam: String? = ""
}
