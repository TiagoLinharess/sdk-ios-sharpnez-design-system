//
//  SHButton.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

public struct SHButton: View {
    // MARK: - Properties
    
    /// Button opacity
    private var opacity: Double {
        isDisabled ? 0.5 : 1
    }
    
    /// Button title
    private let title: String
    
    /// Button image
    private let image: Image?
    
    /// Button style
    private let style: SHButtonStyle
    
    /// Button font
    private let font: Font
    
    /// Button Action
    private let action: () -> Void
    
    /// Button loading state
    @Binding private var isLoading: Bool
    
    /// Button disabled state
    @Binding private var isDisabled: Bool
    
    // MARK: - Init
    
    /// Init
    public init(
        title: String,
        image: Image? = nil,
        style: SHButtonStyle,
        font: Font,
        isLoading: Binding<Bool> = Binding.constant(false),
        isDisabled: Binding<Bool> = Binding.constant(false),
        action: @escaping () -> Void
    ) {
        self.title = title
        self.image = image
        self.style = style
        self.font = font
        self.action = action
        self._isLoading = isLoading
        self._isDisabled = isDisabled
    }
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .center, spacing: .zero) {
            if isLoading {
                loading
            } else {
                button
            }
        }
        .font(font)
        .foregroundColor(style.titleColor.opacity(opacity))
        .padding(.small)
        .background(style.backgroundColor.opacity(opacity))
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .stroke(style.borderColor.opacity(opacity), lineWidth: style.borderWidth)
        }
        .disabled(isDisabled)
    }
    
    // MARK: - Loading
    
    private var loading: some View {
        SHLoading(style: .nano, color: style.titleColor.opacity(opacity))
            .frame(maxWidth: .infinity)
    }
    
    // MARK: - Button
    
    private var button: some View {
        Button {
            action()
        } label: {
            buttonLabel
                .frame(maxWidth: .infinity)
        }
    }
    
    // MARK: - Button Label
    
    private var buttonLabel: some View {
        HStack(spacing: .extraSmall) {
            if let image {
                Label {
                    Text(title)
                } icon: {
                    image
                }
            } else {
                Text(title)
            }
        }
    }
}

// MARK: - Button Style

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
}
