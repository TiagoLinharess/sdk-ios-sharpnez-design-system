//
//  SHPasswordFieldSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 29/11/24.
//

import SharpnezDesignSystem
import SwiftUI

struct SHPasswordFieldSampleView: View, SecuredTextFieldParentProtocol {
    
    @State var text: String = ""
    var hideKeyboard: (() -> Void)?
    
    var body: some View {
        SecuredTextFieldView(text: $text, parent: self)
        SHButton(
            title: "hide keyboard",
            style: .primary(.primarySH, .onPrimarySH),
            font: .body(.montserrat, .medium)
        ) {
            hideKeyboard?()
        }
    }
}
