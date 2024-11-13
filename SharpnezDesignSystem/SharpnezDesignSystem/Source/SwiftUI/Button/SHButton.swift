//
//  SHButton.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

private struct SHButtonModifier: ViewModifier {
    
    // MARK: - Properties
    
    /// Button style.
    private let style: SHButtonStyle
    
    private let font: Font
    
    // MARK: - Init
    
    /// Modifier init.
    init(style: SHButtonStyle, font: Font) {
        self.style = style
        self.font = font
    }
    
    /// Modifier body.
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundColor(style.titleColor)
            .padding(.small)
            .background(style.backgroundColor)
            .cornerRadius(.extraSmall)
            .overlay(
                RoundedRectangle(cornerRadius: .extraSmall)
                    .stroke(style.borderColor, lineWidth: style.borderWidth)
            )
    }
}

private enum SHButtonStyle {
    case primary(Color, Color), secondary(Color), ghost(Color)
    
    /// Background color.
    var backgroundColor: Color {
        switch self {
        case let .primary(backgroundColor, _):
            return backgroundColor
        default:
            return .clear
        }
    }
    
    /// Title color.
    var titleColor: Color {
        switch self {
        case let .primary(_, foregroundColor):
            return foregroundColor
        case let .secondary(color), let .ghost(color):
            return color
        }
    }
    
    /// Border width.
    var borderWidth: CGFloat {
        switch self {
        case .secondary:
            return .two
        default:
            return .zero
        }
    }

    /// Border color.
    var borderColor: Color {
        switch self {
        case let .secondary(color):
            return color
        default:
            return .clear
        }
    }
}

extension Button {
    
    // MARK: - Modifier Implementation
    
    /// Primary button style with Color anf Font.
    public func primarySHStyle(backgroundColor: Color, foregroundColor: Color, font: Font) -> some View {
        modifier(SHButtonModifier(style: .primary(backgroundColor, foregroundColor), font: font))
    }
    
    /// Primary button style with UIColor and UIFont.
    public func primarySHStyle(backgroundColor: UIColor, foregroundColor: UIColor, font: UIFont) -> some View {
        modifier(SHButtonModifier(style: .primary(backgroundColor.color, foregroundColor.color), font: font.font))
    }
    
    /// Secondary button style with Color and Font.
    public func secondarySHStyle(color: Color, font: Font) -> some View {
        modifier(SHButtonModifier(style: .secondary(color), font: font))
    }
    
    /// Secondary button style with UIColor and UIFont.
    public func secondarySHStyle(color: UIColor, font: UIFont) -> some View {
        modifier(SHButtonModifier(style: .secondary(color.color), font: font.font))
    }
    
    ///  Ghost button style with Color and Font.
    public func ghostSHStyle(color: Color, font: Font) -> some View {
        modifier(SHButtonModifier(style: .ghost(color), font: font))
    }
    
    ///  Ghost button style with UIColor and UIFont.
    public func ghostSHStyle(color: UIColor, font: UIFont) -> some View {
        modifier(SHButtonModifier(style: .ghost(color.color), font: font.font))
    }
}
