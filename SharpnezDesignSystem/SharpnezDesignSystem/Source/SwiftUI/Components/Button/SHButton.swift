//
//  SHButton.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

// MARK: Button Style

public enum SHButtonStyle {
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
    
    /// Underline style
    var hasUnderline: Bool {
        switch self {
        case .ghost:
            return true
        default:
            return false
        }
    }
}

public struct SHButton: View {
    // MARK: Properties
    
    /// Button opacity
    private var opacity: Double {
        isDisabled ? 0.5 : 1
    }
    
    /// Button title
    private let title: String
    
    /// Button image
    private let icon: SHIconType?
    
    /// Button style
    private let style: SHButtonStyle
    
    /// Button font
    private let font: DSFontName
    
    /// Button Action
    private let action: () -> Void
    
    /// Button loading state
    private var isLoading: Bool
    
    /// Button disabled state
    private var isDisabled: Bool
    
    // MARK: Init
    
    /// Init
    public init(
        title: String,
        icon: SHIconType? = nil,
        style: SHButtonStyle,
        font: DSFontName,
        isLoading: Bool = false,
        isDisabled: Bool = false,
        action: @escaping () -> Void
    ) {
        self.title = title
        self.icon = icon
        self.style = style
        self.font = font
        self.action = action
        self.isLoading = isLoading
        self.isDisabled = isDisabled
    }
    
    // MARK: Body
    
    public var body: some View {
        HStack(alignment: .center, spacing: .small) {
            if isLoading {
                loading
            } else {
                button
            }
        }
        .font(.body(font, .medium))
        .foregroundColor(style.titleColor.opacity(opacity))
        .padding(.small)
        .frame(height: .xxLarge)
        .background(style.backgroundColor.opacity(opacity))
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .stroke(style.borderColor.opacity(opacity), lineWidth: style.borderWidth)
        }
        .disabled(isDisabled)
    }
    
    // MARK: Loading
    
    private var loading: some View {
        SHLoading(style: .nano, color: style.titleColor.opacity(opacity))
            .frame(maxWidth: .infinity)
    }
    
    // MARK: Button
    
    private var button: some View {
        Button {
            action()
        } label: {
            buttonLabel
                .frame(maxWidth: .infinity)
        }
    }
    
    // MARK: Button Label
    
    private var buttonLabel: some View {
        HStack(spacing: .extraSmall) {
            if let icon {
                Label {
                    Text(title)
                } icon: {
                    SHIcon(icon: icon)
                        .resizable()
                        .renderingMode(.template)
                        .foregroundStyle(style.titleColor)
                        .frame(width: .small, height: .small)
                }
                .underline(style.hasUnderline, color: style.titleColor)
            } else {
                Text(title)
                    .underline(style.hasUnderline, color: style.titleColor)
            }
        }
    }
}
