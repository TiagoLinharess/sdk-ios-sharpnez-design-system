//
//  SHLabelSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHLabelSampleView: View {
    
    var body: some View {
        Label("Hello SHLabel", systemImage: "pencil")
            .configureWithSH(color: .primarySH, font: .title3(.montserrat, .medium))
        Label {
            Text("Hello SHLabel")
        } icon: {
            Image(systemName: "info.circle")
        }
        .configureWithSH(color: .secondarySH, font: .subtitle(.montserrat, .medium))
        Text("Hello SHLabel")
            .configureWithSH(color: .onBackgroundSH, font: .body(.poppins, .regular))
    }
}
