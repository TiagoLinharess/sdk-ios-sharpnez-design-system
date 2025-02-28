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
    @MainActor
    static func primary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex:  DesignSystemConfiguration.shared?.flavorColors?.primary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.primaryDark,
            colorScheme: colorScheme
        )
    }
    
    /// on primary color with theme
    @MainActor
    static func onPrimary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onPrimary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onPrimaryDark,
            colorScheme: colorScheme
        )
    }
    
    /// secondary color with theme
    @MainActor
    static func secondary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.secondary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.secondaryDark,
            colorScheme: colorScheme
        )
    }
    
    /// on secondary color with theme
    @MainActor
    static func onSecondary(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSecondary,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSecondaryDark,
            colorScheme: colorScheme
        )
    }
    
    /// surface color with theme
    @MainActor
    static func surface(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.surface,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.surfaceDark,
            colorScheme: colorScheme
        )
    }
    
    /// on surface color with theme
    @MainActor
    static func onSurface(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSurface,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSurfaceDark,
            colorScheme: colorScheme
        )
    }
    
    /// background color with theme
    @MainActor
    static func background(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.background,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.backgroundDark,
            colorScheme: colorScheme
        )
    }
    
    /// on background color with theme
    @MainActor
    static func onBackground(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onBackground,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onBackgroundDark,
            colorScheme: colorScheme
        )
    }
    
    /// success color with theme
    @MainActor
    static func success(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.success,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.successDark,
            colorScheme: colorScheme
        )
    }
    
    /// on success color with theme
    @MainActor
    static func onSuccess(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSuccess,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onSuccessDark,
            colorScheme: colorScheme
        )
    }
    
    /// warning color with theme
    @MainActor
    static func warning(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.warning,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.warningDark,
            colorScheme: colorScheme
        )
    }
    
    /// on warning color with theme
    @MainActor
    static func onWarning(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onWarning,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onWarningDark,
            colorScheme: colorScheme
        )
    }
    
    /// error color with theme
    @MainActor
    static func error(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.error,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.errorDark,
            colorScheme: colorScheme
        )
    }
    
    /// on error color with theme
    @MainActor
    static func onError(colorScheme: ColorScheme? = nil) -> Color {
        return getColorWithTheme(
            lightColorHex: DesignSystemConfiguration.shared?.flavorColors?.onError,
            darkColorHex: DesignSystemConfiguration.shared?.flavorColors?.onErrorDark,
            colorScheme: colorScheme
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
