//
//  FlavorColors.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 13/11/24.
//

public protocol FlavorColorsProtocol {
    var primary: String { get }
    var onPrimary: String { get }
    var secondary: String { get }
    var onSecondary: String { get }
    var surface: String { get }
    var onSurface: String { get }
    var background: String { get }
    var onBackground: String { get }
    var success: String { get }
    var onSuccess: String { get }
    var warning: String { get }
    var onWarning: String { get }
    var error: String { get }
    var onError: String { get }
    
    var primaryDark: String { get }
    var onPrimaryDark: String { get }
    var secondaryDark: String { get }
    var onSecondaryDark: String { get }
    var surfaceDark: String { get }
    var onSurfaceDark: String { get }
    var backgroundDark: String { get }
    var onBackgroundDark: String { get }
    var successDark: String { get }
    var onSuccessDark: String { get }
    var warningDark: String { get }
    var onWarningDark: String { get }
    var errorDark: String { get }
    var onErrorDark: String { get }
}
