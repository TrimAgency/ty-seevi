//
//  PaymentMethod.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/11/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation

struct SVPaymentMethod {
    var cardNumber: String? = ""
    var cardDate: String? = "" //NOTE: This would likely be converted from actual NSDate
    var cvvNum: String? = ""
    var cardNam: String? = ""
}
