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

extension Font {
    
    // MARK: - Fonts
    
    /// Title 1.
    /// Custom font with xxBig size
    public static func title1(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .xxBig)?.font ?? UIFont.systemFont(ofSize: .xxBig).font
    }
    
    /// Title 2.
    /// Custom font with xBig size
    public static func title2(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .xBig)?.font ?? UIFont.systemFont(ofSize: .xBig).font
    }
    
    /// Title 3.
    /// Custom font with big size
    public static func title3(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .big)?.font ?? UIFont.systemFont(ofSize: .big).font
    }
    
    /// Sub Title.
    /// Custom font with medium size
    public static func subtitle(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .medium)?.font ?? UIFont.systemFont(ofSize: .medium).font
    }
    
    /// Body.
    /// Custom font with small size
    public static func body(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .small)?.font ?? UIFont.systemFont(ofSize: .small).font
    }
    
    /// Caption.
    /// Custom font with smaller size
    public static func caption(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont(name: "\(style.rawValue)-\(weight.rawValue)", size: .smaller)?.font ?? UIFont.systemFont(ofSize: .smaller).font
    }
}

extension UIFont {
    
    // MARK: - UIFont to Font
    
    /// UIFont to SwiftUI Font
    public var font: Font {
        Font(self)
    }
}
