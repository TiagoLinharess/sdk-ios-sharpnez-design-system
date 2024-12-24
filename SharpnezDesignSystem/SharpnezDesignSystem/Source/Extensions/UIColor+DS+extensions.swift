//
//  UIColor+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 23/12/24.
//

import UIKit

public extension UIColor {
    
    // MARK: Colors
    
    /// primarySH
    static var primarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.primary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onPrimarySH
    static var onPrimarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onPrimary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// secondarySH
    static var secondarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.secondary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSecondarySH
    static var onSecondarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSecondary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// surfaceSH
    static var surfaceSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.surface
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSurfaceSH
    static var onSurfaceSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSurface
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// backgroundSH
    static var backgroundSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.background
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onBackgroundSH
    static var onBackgroundSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onBackground
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// successSH
    static var successSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.success
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSuccessSH
    static var onSuccessSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSuccess
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// warningSH
    static var warningSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.warning
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onWarningSH
    static var onWarningSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onWarning
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// errorSH
    static var errorSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.error
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onErrorSH
    static var onErrorSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onError
        else { return .white }
        return UIColor(hex: color)
    }
}

public extension UIColor {
    
    // MARK: Hex String to UIColor
    
    /// Transforms hex string colors in to UIColor object.
    convenience init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(red: CGFloat(r), green: CGFloat(g), blue: CGFloat(b), alpha: CGFloat(a))
    }
}
