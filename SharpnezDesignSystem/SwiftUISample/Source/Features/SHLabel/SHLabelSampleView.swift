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
            .configureWithSH(color: .darkContent, font: .title3(.montserrat, .medium))
        Label {
            Text("Hello SHLabel")
        } icon: {
            Image(systemName: "info.circle")
        }
        .configureWithSH(color: .blue100, font: .subtitle(.montserrat, .medium))
        Text("Hello SHLabel")
            .configureWithSH(color: .gray100, font: .body(.poppins, .regular))
    }
}
