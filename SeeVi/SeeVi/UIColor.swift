//
//  UIColor.swift
//  SeeVi
//
//  Created by Ty Daniels on 4/10/17.
//  Copyright © 2017 Ty Daniels. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var svBrightLightBlue: UIColor {
        return UIColor(red: 48.0 / 255.0, green: 197.0 / 255.0, blue: 1.0, alpha: 1.0)
    }
    
    class var svRobinEggBlue: UIColor {
        return UIColor(red: 122.0 / 255.0, green: 1.0, blue: 250.0 / 255.0, alpha: 1.0)
    }
    
    class var svRedPink: UIColor {
        return UIColor(red: 243.0 / 255.0, green: 51.0 / 255.0, blue: 87.0 / 255.0, alpha: 1.0)
    }
    
    class var svLightGold: UIColor {
        return UIColor(red: 1.0, green: 231.0 / 255.0, blue: 76.0 / 255.0, alpha: 1.0)
    }
    
    class var svWarmGrey: UIColor {
        return UIColor(white: 140.0 / 255.0, alpha: 1.0)
    }
    
    class var svDarkBlue: UIColor {
        return UIColor().stringToUIColor(hex: "#0A2463")
    }
    
    fileprivate func stringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.characters.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
