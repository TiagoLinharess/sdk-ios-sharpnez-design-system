//
//  DesignSystemConfiguration.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 13/07/23.
//

import UIKit

// MARK: DesignSystemConfiguration

/// DesignSystem main Configuration.
public final class DesignSystemConfiguration: NSObject {
    // MARK: Proeprties
    
    public static var shared: DesignSystemConfiguration?
    var flavorColors: FlavorColorsProtocol?
    
    // MARK: Start
    
    /// Start Singleton Method
    public class func start(flavorColors: FlavorColorsProtocol) {
        shared = DesignSystemConfiguration()
        shared?.loadFonts()
        shared?.loadColors(from: flavorColors)
    }
    
    // MARK: Load Fonts
    
    /// Load DesignSystem fonts
    func loadFonts() {
        let bundle = Bundle.init(for: DesignSystemConfiguration.self)
        
        /// List the fonts by name and extension, relative to the bundle.
        let fonts = [
            bundle.url(forResource: DSConstants.Fonts.poppinsBoldFont, withExtension: DSConstants.Fonts.fontsExtension),
            bundle.url(forResource: DSConstants.Fonts.poppinsMediumFont, withExtension: DSConstants.Fonts.fontsExtension),
            bundle.url(forResource: DSConstants.Fonts.poppinsRegularFont, withExtension: DSConstants.Fonts.fontsExtension),
            bundle.url(forResource: DSConstants.Fonts.montserratBoldFont, withExtension: DSConstants.Fonts.fontsExtension),
            bundle.url(forResource: DSConstants.Fonts.montserratMediumFont, withExtension: DSConstants.Fonts.fontsExtension),
            bundle.url(forResource: DSConstants.Fonts.montserratRegularFont, withExtension: DSConstants.Fonts.fontsExtension)
        ]
        
        fonts
            .compactMap { $0 }
            .compactMap { CGDataProvider(url: $0 as CFURL) }
            .map(CGFont.init)
            .forEach { CTFontManagerRegisterGraphicsFont($0! , nil) }
    }
    
    // MARK: Load Colors
    
    func loadColors(from flavor: FlavorColorsProtocol) {
        self.flavorColors = flavor
    }
}
