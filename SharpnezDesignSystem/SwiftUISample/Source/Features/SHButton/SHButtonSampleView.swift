//
//  SHButtonSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 01/08/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHButtonSampleView: View {
    var body: some View {
        Button("Hello SHButton") {
            print("Hello SHButton")
        }
        .primarySHStyle(backgroundColor: .blue100, foregroundColor: .lightContent, font: .title3(.montserrat, .medium))
        Button {
            print("Hello SHButton")
        } label: {
            Label("Hello SHButton", systemImage: "pencil")
        }
        .secondarySHStyle(color: .red100, font: .subtitle(.poppins, .medium))
        Button {
            print("Hello SHButton")
        } label: {
            Text("Hello SHButton")
        }
        .ghostSHStyle(color: .green100, font: .body(.poppins, .regular))
    }
}
