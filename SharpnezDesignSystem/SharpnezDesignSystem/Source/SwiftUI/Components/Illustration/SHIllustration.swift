//
//  SHIllustration.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SwiftUI

public enum SHIllustrationType: String {
    
    // MARK: UISHIcon
    
    case biometry
    case pin
    case recover
    case security
}

public struct SHIllustration: View {
    
    // MARK: Properties
    
    /// Icon
    private let illustration: SHIllustrationType
    
    // MARK: Init
    
    /// Init
    public init(illustration: SHIllustrationType) {
        self.illustration = illustration
    }
    
    // MARK: Body
    
    public var body: some View {
        image()
    }
    
    /// Resizable component
    @ViewBuilder
    public func resizable() -> Image {
        image()
            .resizable()
    }
    
    @ViewBuilder
    func image() -> Image {
        Image(illustration.rawValue, bundle: BundleToken.bundle)
    }
}
