//
//  DSConstants.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 13/07/23.
//

import Foundation

// MARK: Constants

enum DSConstants {
    
    // MARK: Fonts
    
    /// Fonts Constants.
    enum Fonts {
        
        /// Poppins-Bold
        static let poppinsBoldFont: String = "Poppins-Bold"
        
        /// Poppins-Medium
        static let poppinsMediumFont: String = "Poppins-Medium"
        
        /// Poppins-Regular
        static let poppinsRegularFont: String = "Poppins-Regular"
        
        /// Montserrat-Bold
        static let montserratBoldFont: String = "Montserrat-Bold"
        
        /// Montserrat-Bold
        static let montserratMediumFont: String = "Montserrat-Medium"
        
        /// Montserrat-Regular
        static let montserratRegularFont: String = "Montserrat-Regular"
        
        /// Fonts extension
        static let fontsExtension: String = "ttf"
    }
    
    // MARK: Icons
    
    /// Icons constants
    enum Icons {
        
        /// checkmark.circle.fill
        static let checkmarkCircleFill: String = "checkmark.circle.fill"
        
        /// exclamationmark.triangle.fill
        static let exclamationmarkTriangleFill: String = "exclamationmark.triangle.fill"
        
        /// exclamationmark.octagon.fill
        static let exclamationmarkOctagonFill: String = "exclamationmark.octagon.fill"
        
        /// info.circle.fill
        static let infoCircleFill: String = "info.circle.fill"
        
        /// eye
        static let eyeOpen: String = "eye"
        
        /// eye.slash
        static let eyeClosed: String = "eye.slash"
        
        /// chevron.left
        static let arrowLeft: String = "arrow.left"
        
        /// xmark
        static let close: String = "xmark"
    }
    
    // MARK: Commons
    
    /// Commons Contants.
    enum Commons {
        
        /// •
        static let dot: String = "•"
        
        /// Space
        static let space: String = " "
    }
    
    // MARK: UIKit
    
    /// UIKit Constants.
    enum UIKit {
        
        /// String for nscoder initialize.
        /// value: init(coder:) has not been implemented
        static let coderInitMessage: String = "init(coder:) has not been implemented"
    }
}
