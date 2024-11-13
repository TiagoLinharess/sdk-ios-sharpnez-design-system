//
//  Color+DS+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import SwiftUI
import UIKit

public extension Color  {
    
    // MARK: - Colors
    
    static var primarySH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.primary
        else { return .white }
        return Color(hex: color)
    }
    
    static var onPrimarySH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onPrimary
        else { return .white }
        return Color(hex: color)
    }
    
    static var secondarySH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.secondary
        else { return .white }
        return Color(hex: color)
    }
    
    static var onSecondarySH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSecondary
        else { return .white }
        return Color(hex: color)
    }
    
    static var surfaceSH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.surface
        else { return .white }
        return Color(hex: color)
    }
    
    static var onSurfaceSH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onSurface
        else { return .white }
        return Color(hex: color)
    }
    
    static var backgroundSH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.background
        else { return .white }
        return Color(hex: color)
    }
    
    static var onBackgroundSH: Color {
        guard let color = DesignSystemConfiguration.shared?.flavorColors?.onBackground
        else { return .white }
        return Color(hex: color)
    }
}

public extension Color {
    
    // MARK: - Hex String to UIColor
    
    /// Transforms hex string colors in to UIColor object.
    init(hex: String) {
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

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}