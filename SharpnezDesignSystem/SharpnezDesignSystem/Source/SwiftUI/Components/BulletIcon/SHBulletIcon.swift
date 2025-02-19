//
//  SHBulletIcon.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SwiftUI

public struct SHBulletIcon: View {
    
    // MARK: Properties
    
    /// Icon
    private let icon: SHIconType
    
    /// Icon color
    private let color: Color
    
    /// Icon background color
    private let backgroundColor: Color
    
    // MARK: Init
    
    /// Init
    public init(icon: SHIconType, color: Color, backgroundColor: Color) {
        self.icon = icon
        self.color = color
        self.backgroundColor = backgroundColor
    }
    
    // MARK: Body
    
    public var body: some View {
        Image(icon.rawValue, bundle: BundleToken.bundle)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: .big, height: .big)
            .foregroundStyle(color)
            .padding(.smaller)
            .background(backgroundColor)
            .clipShape(.circle)
    }
}
