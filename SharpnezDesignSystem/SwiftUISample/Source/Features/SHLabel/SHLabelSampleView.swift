//
//  SHLabelSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHLabelSampleView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        Label("Hello SHLabel", systemImage: "pencil")
            .configureWithSH(
                color: .primary(colorScheme: colorScheme),
                font: .title3(.montserrat, .medium)
            )
        Label {
            Text("Hello SHLabel")
        } icon: {
            Image(systemName: "info.circle")
        }
        .configureWithSH(
            color: .secondary(colorScheme: colorScheme),
            font: .subtitle(.montserrat, .medium)
        )
        Text("Hello SHLabel")
            .configureWithSH(
                color: .onBackground(colorScheme: colorScheme),
                font: .body(.poppins, .regular)
            )
    }
}
