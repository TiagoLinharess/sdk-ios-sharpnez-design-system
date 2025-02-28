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
    @MainActor
    static var primarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.primary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onPrimarySH
    @MainActor
    static var onPrimarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onPrimary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// secondarySH
    @MainActor
    static var secondarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.secondary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSecondarySH
    @MainActor
    static var onSecondarySH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSecondary
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// surfaceSH
    @MainActor
    static var surfaceSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.surface
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSurfaceSH
    @MainActor
    static var onSurfaceSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSurface
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// backgroundSH
    @MainActor
    static var backgroundSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.background
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onBackgroundSH
    @MainActor
    static var onBackgroundSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onBackground
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// successSH
    @MainActor
    static var successSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.success
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onSuccessSH
    @MainActor
    static var onSuccessSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSuccess
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// warningSH
    @MainActor
    static var warningSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.warning
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onWarningSH
    @MainActor
    static var onWarningSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onWarning
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// errorSH
    @MainActor
    static var errorSH: UIColor {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.error
        else { return .white }
        return UIColor(hex: color)
    }
    
    /// onErrorSH
    @MainActor
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
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            self.init(red: 0, green: 0, blue: 0, alpha: 0)
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        self.init(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
