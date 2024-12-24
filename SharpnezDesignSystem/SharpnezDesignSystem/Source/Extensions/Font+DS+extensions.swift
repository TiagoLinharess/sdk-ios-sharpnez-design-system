//
//  UIFont+DS+extensions.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 13/07/23.
//

import SwiftUI

// MARK: Font Extension

extension Font {
    
    /// Title 1.
    /// Custom font with xxBig size
    public static func title1(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.title1(style, weight).font
    }
    
    /// Title 2.
    /// Custom font with xBig size
    public static func title2(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.title2(style, weight).font
    }
    
    /// Title 3.
    /// Custom font with big size
    public static func title3(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.title3(style, weight).font
    }
    
    /// Sub Title.
    /// Custom font with medium size
    public static func subtitle(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.subtitle(style, weight).font
    }
    
    /// Body.
    /// Custom font with small size
    public static func body(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.body(style, weight).font
    }
    
    /// Caption.
    /// Custom font with smaller size
    public static func caption(_ style: DSFontName, _ weight: DSFontWeight) -> Font {
        return UIFont.caption(style, weight).font
    }
}
