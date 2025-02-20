//
//  SHIcon.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SwiftUI

public enum SHIconType: String {
    
    // MARK: UISHIcon
    
    case profile
    case addProfile
    case bills
    case budget
    case card
    case coin
    case product
    case success
    case error
    case warning
    case info
}

public struct SHIcon: View {
    
    // MARK: Properties
    
    /// Icon
    private let icon: SHIconType
    
    // MARK: Init
    
    /// Init
    public init(icon: SHIconType) {
        self.icon = icon
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
        Image(icon.rawValue, bundle: BundleToken.bundle)
    }
}
