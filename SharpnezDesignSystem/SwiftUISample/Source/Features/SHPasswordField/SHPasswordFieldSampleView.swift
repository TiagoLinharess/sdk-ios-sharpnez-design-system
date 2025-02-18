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
    
    var body: some View {
        SHPasswordField(
            title: "Senha",
            color: .primarySH,
            font: .montserrat,
            text: $text
        )
    }
}
