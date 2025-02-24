//
//  Color+DS+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 06/07/23.
//

import SwiftUI

public extension Color {
    
    // MARK: Colors
    
    /// primary color with theme
    static func primary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.primary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onPrimary,
            colorScheme: colorScheme
        )
    }
    
    /// on primary color with theme
    static func onPrimary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onPrimary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.primary,
            colorScheme: colorScheme
        )
    }
    
    /// secondary color with theme
    static func secondary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.secondary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSecondary,
            colorScheme: colorScheme
        )
    }
    
    /// on secondary color with theme
    static func onSecondary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSecondary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.secondary,
            colorScheme: colorScheme
        )
    }
    
    /// surface color with theme
    static func surface(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.surface,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSurface,
            colorScheme: colorScheme
        )
    }
    
    /// on surface color with theme
    static func onSurface(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSurface,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.surface,
            colorScheme: colorScheme
        )
    }
    
    /// background color with theme
    static func background(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.background,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onBackground,
            colorScheme: colorScheme
        )
    }
    
    /// on background color with theme
    static func onBackground(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onBackground,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.background,
            colorScheme: colorScheme
        )
    }
    
    /// success color
    static func success() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.success
        )
    }
    
    /// on success color
    static func onSuccess() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.onSuccess
        )
    }
    
    /// warning color
    static func warning() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.warning
        )
    }
    
    /// on warning color
    static func onWarning() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.onWarning
        )
    }
    
    /// error color
    static func error() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.error
        )
    }
    
    /// on error color
    static func onError() -> Color {
        return getColorWithoutTheme(
            colorHex: DesignSystemConfiguration.shared?.flavorColors?.onError
        )
    }
    
    // MARK: Private methods
    
    private static func getColorWithTheme(
        lightColorHex: String?,
        darkColorHex: String?,
        colorScheme: ColorScheme?
    ) -> Color {
        guard let lightColorHex, let darkColorHex else { return .white }
        
        var color = lightColorHex
        
        if let colorScheme, colorScheme == .dark {
            color = darkColorHex
        }
        
        return Color(hex: color)
    }
    
    private static func getColorWithoutTheme(colorHex: String?) -> Color {
        guard let colorHex else { return .white }
        return Color(hex: colorHex)
    }
}

public extension Color {
    
    // MARK: Hex String to Color
    
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
