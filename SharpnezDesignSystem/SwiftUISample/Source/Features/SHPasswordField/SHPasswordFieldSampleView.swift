//
//  SHPasswordFieldSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 29/11/24.
//

import SharpnezDesignSystem
import SwiftUI

struct SHPasswordFieldSampleView: View {
    
    @State var text: String = ""
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHPasswordField(
            title: "Senha",
            color: .primary(colorScheme: colorScheme),
            font: .montserrat,
            text: $text
        )
    }
}
