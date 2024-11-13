//
//  UIColor+DS+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import SwiftUI
import UIKit

extension UIColor  {
    
    // MARK: - Colors
    
    /// Light Content
    /// #EBEBEB
    public static var lightContent: UIColor {
        return hexStringToUIColor(hex: "#EBEBEB")
    }
    
    /// Dark Content
    /// #292020
    public static var darkContent: UIColor {
        return hexStringToUIColor(hex: "#292020")
    }
    
    /// Gray 100
    /// #7E7E7E
    public static var gray100: UIColor {
        return hexStringToUIColor(hex: "#7E7E7E")
    }
    
    /// Gray 50
    /// #EBEDEF
    public static var gray50: UIColor {
        return hexStringToUIColor(hex: "#EBEDEF")
    }
    
    /// LightBlue 100
    /// #54BED2
    public static var lightBlue100: UIColor {
        return hexStringToUIColor(hex: "#54BED2")
    }
    
    /// Blue 100
    /// #324ADF
    public static var blue100: UIColor {
        return hexStringToUIColor(hex: "#324ADF")
    }
    
    /// Purple 100
    /// #740CC5
    public static var purple100: UIColor {
        return hexStringToUIColor(hex: "#740CC5")
    }
    
    /// Red 100
    /// #D61B1B
    public static var red100: UIColor {
        return hexStringToUIColor(hex: "#D61B1B")
    }
    
    /// Orange 100
    /// #E9A30C
    public static var orange100: UIColor {
        return hexStringToUIColor(hex: "#E9A30C")
    }
    
    /// Yellow 100
    /// #E9FA18
    public static var yellow100: UIColor {
        return hexStringToUIColor(hex: "#E9FA18")
    }
    
    /// Green 100
    /// #68C151
    public static var green100: UIColor {
        return hexStringToUIColor(hex: "#4ED82B")
    }
    
    /// Green 75
    /// #68C151
    public static var green75: UIColor {
        return hexStringToUIColor(hex: "#68C151")
    }
}

extension UIColor {
    
    // MARK: - UIColor to Color
    
    /// UIColor to SwiftUI Color
    public var color: Color {
        Color(uiColor: self)
    }
}

extension UIColor {
    
    // MARK: - Hex String to UIColor
    
    /// Transforms hex string colors in to UIColor object.
    public static func hexStringToUIColor(hex: String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }

        if ((cString.count) != 6) {
            return UIColor.gray
        }

        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
