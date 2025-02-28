//
//  SHCurrencyField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/02/25.
//

import CurrencyTextField
import CurrencyFormatter
import SwiftUI

public struct SHCurrencyField: View {
    
    // MARK: Properties
    
    /// TextField title
    private let title: String
    
    /// TextField color
    private let color: Color
    
    /// TextField font
    private let font: DSFontName
    
    /// TextField text
    @Binding private var text: String
    
    @State private var currencyFormatter = CurrencyFormatter {
        let currency = Locale.current.currency?.identifier ?? "BRL"
        $0.currency = .init(rawValue: currency) ?? .brazilianReal
        $0.locale = Locale.current
        $0.hasDecimals = true
        $0.minValue = .zero
        $0.maxValue = 999999999999.99
    }
    
    // MARK: Init
    
    /// Init
    public init(title: String, text: Binding<String>, color: Color, font: DSFontName) {
        self.title = title
        self._text = text
        self.color = color
        self.font = font
    }
    
    // MARK: Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .extraSmall) {
            Text(title)
                .configureWithSH(color: color, font: .body(font, .medium))
                .padding(.leading, .small)
            CurrencyTextField(configuration: .init(
                placeholder: String(),
                text: $text,
                formatter: currencyFormatter,
                textFieldConfiguration: { uiTextField in
                    uiTextField.font = .body(font, .medium)
                    uiTextField.textColor = UIColor(color)
                    uiTextField.autocorrectionType = .no
                    uiTextField.keyboardType = .numbersAndPunctuation
                    uiTextField.layer.masksToBounds = true
                }
            ))
            .padding(.smaller)
            .overlay {
                RoundedRectangle(cornerRadius: .extraSmall)
                    .stroke(color, lineWidth: .two)
            }
        }
    }
}
