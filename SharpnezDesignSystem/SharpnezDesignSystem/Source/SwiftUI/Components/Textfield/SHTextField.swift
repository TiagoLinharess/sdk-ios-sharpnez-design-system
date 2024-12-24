//
//  SHTextField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/11/24.
//

import SwiftUI

public struct SHTextField: View {
    // MARK: - Properties
    
    /// TextField title
    private let title: String
    
    /// TextField color
    private let color: Color
    
    /// TextField font
    private let font: Font
    
    /// TextField title font
    private let titleFont: Font
    
    /// TextField rules
    private let rules: [SHRulesListViewModel]
    
    /// TextField content type
    private let contentType: UITextContentType?
    
    /// TextField content type
    private let keyboardType: UIKeyboardType?
    
    /// TextField text
    @Binding private var text: String
    
    // MARK: - Init
    
    /// Init
    public init(
        title: String,
        color: Color,
        font: Font,
        titleFont: Font,
        text: Binding<String>,
        rules: [SHRulesListViewModel] = [],
        contentType: UITextContentType? = nil,
        keyboardType: UIKeyboardType? = nil
    ) {
        self.title = title
        self.color = color
        self.font = font
        self.titleFont = titleFont
        self.rules = rules
        self.contentType = contentType
        self.keyboardType = keyboardType
        self._text = text
    }
    
    // MARK: - Body
    
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(title)
                .configureWithSH(color: color, font: titleFont)
                .padding(.leading, .small)
            TextField(String(), text: $text)
                .textInputAutocapitalization(.never)
                .autocorrectionDisabled()
                .textContentType(contentType)
                .keyboardType(keyboardType ?? .default)
                .font(font)
                .foregroundStyle(color)
                .padding(.smaller)
                .clipShape(.capsule)
                .overlay {
                    Capsule()
                        .stroke(color, lineWidth: .two)
                }
            if !rules.isEmpty {
                SHRulesListView(
                    items: rules,
                    font: .caption(.montserrat, .regular),
                    defaultColor: color
                )
                .padding(.leading, .extraSmall)
            }
        }
    }
}
