//
//  SHTextField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/11/24.
//

import SwiftUI

public struct SHTextField: View {
    // MARK: Properties
    
    /// TextField title
    private let title: String
    
    /// TextField color
    private let color: Color
    
    /// TextField font
    private let font: DSFontName
    
    /// TextField rules
    private let rules: [SHListItemViewModel]
    
    /// TextField content type
    private let contentType: UITextContentType?
    
    /// TextField content type
    private let keyboardType: UIKeyboardType?
    
    /// TextField text
    @Binding private var text: String
    
    // MARK: Init
    
    /// Init
    public init(
        title: String,
        color: Color,
        font: DSFontName,
        text: Binding<String>,
        rules: [SHListItemViewModel] = [],
        contentType: UITextContentType? = nil,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.title = title
        self.color = color
        self.font = font
        self.rules = rules
        self.contentType = contentType
        self.keyboardType = keyboardType
        self._text = text
    }
    
    // MARK: Body
    
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(title)
                .configureWithSH(color: color, font: .body(font, .medium))
                .padding(.leading, .small)
            TextField(String(), text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textContentType(contentType)
                .keyboardType(keyboardType ?? .default)
                .font(.body(font, .medium))
                .foregroundStyle(color)
                .padding(.smaller)
                .overlay {
                    RoundedRectangle(cornerRadius: .extraSmall)
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
}
