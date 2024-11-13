//
//  UIFont+DS+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 13/07/23.
//

import SwiftUI

// MARK: - DSFontName

public enum DSFontName: String {
    case poppins = "Poppins"
    case montserrat = "Montserrat"
}

// MARK: - DSFontWeight

public enum DSFontWeight: String {
    case regular = "Regular"
    case medium = "Medium"
    case bold = "Bold"
}

// MARK: - UIFont Extension

extension UIFont {
    
    // MARK: - Fonts
    
    /// Title 1.
    /// Custom font with xxBig size
    public static func title1(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .xxBig) ?? UIFont.systemFont(ofSize: .xxBig)
    }
    
    /// Title 2.
    /// Custom font with xBig size
    public static func title2(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .xBig) ?? UIFont.systemFont(ofSize: .xBig)
    }
    
    /// Title 3.
    /// Custom font with big size
    public static func title3(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .big) ?? UIFont.systemFont(ofSize: .big)
    }
    
    /// Sub Title.
    /// Custom font with medium size
    public static func subtitle(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .medium) ?? UIFont.systemFont(ofSize: .medium)
    }
    
    /// Body.
    /// Custom font with small size
    public static func body(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .small) ?? UIFont.systemFont(ofSize: .small)
    }
    
    /// Caption.
    /// Custom font with smaller size
    public static func caption(_ style: DSFontName, _ weight: DSFontWeight) -> UIFont {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .smaller) ?? UIFont.systemFont(ofSize: .smaller)
    }
}

extension UIFont {
    
    // MARK: - UIFont to Font
    
    /// UIFont to SwiftUI Font
    public var font: Font {
        Font(self)
    }
}
