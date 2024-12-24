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
    
    var body: some View {
        SHTextField(
            title: "Sem mascara",
            color: .primarySH,
            font: .body(.montserrat, .medium),
            titleFont: .subtitle(.montserrat, .medium),
            text: $text
        )
        SHTextField(
            title: "Email",
            color: .secondarySH,
            font: .body(.montserrat, .medium),
            titleFont: .subtitle(.montserrat, .medium),
            text: $text1,
            contentType: .emailAddress,
            keyboardType: .emailAddress
        )
    }
}