//
//  SHPasswordField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 29/11/24.
//

import SwiftUI

public struct SHPasswordField: View {
    // MARK: Enum

    /// Options for opacity of the fields.
    enum Opacity: Double {

        case hide = 0.0
        case show = 1.0

        /// Toggle the field opacity.
        mutating func toggle() {
            switch self {
            case .hide:
                self = .show
            case .show:
                self = .hide
            }
        }
    }
    
    // MARK: Properties
    
    /// TextField title
    private let title: String
    
    /// TextField color
    private let color: Color
    
    /// TextField font
    private let font: Font
    
    /// TextField title font
    private let titleFont: Font
    
    /// TextField rules
    private let rules: [SHListItemViewModel]

    /// The show / hide state of the text.
    @State private var isSecured: Bool = true

    /// The opacity of the SecureField.
    @State private var hidePasswordFieldOpacity = Opacity.show

    /// The opacity of the TextField.
    @State private var showPasswordFieldOpacity = Opacity.hide

    /// TextField text
    @Binding var text: String
    
    // MARK: Init
    
    /// Init
    public init(
        title: String,
        color: Color,
        font: Font,
        titleFont: Font,
        text: Binding<String>,
        rules: [SHListItemViewModel] = []
    ) {
        self.title = title
        self.color = color
        self.font = font
        self.titleFont = titleFont
        self._text = text
        self.rules = rules
    }

    // MARK: Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(title)
                .configureWithSH(color: color, font: titleFont)
                .padding(.leading, .small)
            ZStack(alignment: .trailing) {
                securedTextField
                    .textInputAutocapitalization(.never)
                    .keyboardType(.asciiCapable)
                    .autocorrectionDisabled()
                    .font(font)
                    .foregroundStyle(color)

                Button(action: {
                    performToggle()
                }, label: {
                    Image(
                        systemName: isSecured
                        ? DSConstants.Icons.eyeClosed
                        : DSConstants.Icons.eyeOpen
                    )
                    .accentColor(color)
                    .padding(.trailing, .extraSmall)
                    .font(font)
                })
            }
            .padding(.smaller)
            .clipShape(.capsule)
            .overlay {
                Capsule()
                    .stroke(color, lineWidth: .two)
            }
            if !rules.isEmpty {
                SHListItemView(
                    items: rules,
                    font: .caption(.montserrat, .regular),
                    defaultColor: color
                )
                .padding(.leading, .extraSmall)
            }
        }
    }

    /// Secured field with the show / hide capability.
    var securedTextField: some View {
        Group {
            SecureField(String(), text: $text)
                .opacity(hidePasswordFieldOpacity.rawValue)

            TextField(String(), text: $text)
                .opacity(showPasswordFieldOpacity.rawValue)
        }
    }
    
    // MARK: Private Methods
    
    /// Perform the show / hide toggle by changing the properties.
    private func performToggle() {
        isSecured.toggle()
        hidePasswordFieldOpacity.toggle()
        showPasswordFieldOpacity.toggle()
    }
}
