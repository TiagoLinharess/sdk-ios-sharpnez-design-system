//
//  SHShortcutButton.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 13/11/24.
//

import SwiftUI

public struct SHShortcutButton: View {
    // MARK: Properties
    
    /// Button icon
    private let icon: SHIconType
    
    /// Button text
    private let label: String
    
    /// Button Font
    private let font: DSFontName
    
    /// Button Color
    private let color: Color
    
    /// Button on color
    private let onColor: Color
    
    /// Button Action
    private let action: () -> Void
    
    // MARK: Init
    
    /// Init
    public init(
        icon: SHIconType,
        label: String,
        font: DSFontName,
        color: Color,
        onColor: Color,
        action: @escaping () -> Void
    ) {
        self.icon = icon
        self.label = label
        self.font = font
        self.color = color
        self.onColor = onColor
        self.action = action
    }
    
    // MARK: Body
    
    public var body: some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                SHIcon(icon: icon)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundStyle(onColor)
                    .frame(width: .small, height: .small)
                    .padding([.leading, .top], .smaller)
                Spacer()
                Text(label)
                    .configureWithSH(color: onColor, font: .caption(font, .medium))
                    .lineLimit(2)
                    .padding([.leading, .bottom], .smaller)
            }
            Spacer()
        }
        .frame(width: .superGiant, height: .superGiant)
        .background(color)
        .clipShape(.buttonBorder)
        .onTapGesture(perform: action)
    }
}
