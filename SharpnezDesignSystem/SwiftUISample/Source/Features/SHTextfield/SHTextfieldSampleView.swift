//
//  SHTextfieldSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/11/24.
//

import SharpnezDesignSystem
import SwiftUI

struct SHTextfieldSampleView: View {
    
    @State var text: String = ""
    @State var text1: String = ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHTextField(
            title: "Sem mascara",
            color: .primary(colorScheme: colorScheme),
            font: .montserrat,
            text: $text
        )
        SHTextField(
            title: "Email",
            color: .secondary(colorScheme: colorScheme),
            font: .montserrat,
            text: $text1,
            contentType: .emailAddress,
            keyboardType: .emailAddress
        )
    }
}
