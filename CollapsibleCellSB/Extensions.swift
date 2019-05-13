//
//  Extensions.swift
//  CollapsibleCellSB
//
//  Created by Josh R on 5/13/19.
//  Copyright © 2019 Josh R. All rights reserved.
//

import Foundation
import UIKit

//Convert hex string to UIColor
func hexStringToUIColor(_ hex:String) -> UIColor {
    var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
    
    if (cString.hasPrefix("#")) {
        cString.remove(at: cString.startIndex)
    }
    
    if ((cString.count) != 6) {
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


func convertRadiansToDegrees(_ degrees: Double) -> CGFloat {
    let conversion = 180.0/3.14
    return CGFloat(degrees / conversion)
}
