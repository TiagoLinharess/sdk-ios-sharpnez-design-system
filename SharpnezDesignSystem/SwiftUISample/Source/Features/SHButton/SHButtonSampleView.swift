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
        .primarySHStyle(font: .title3(.poppins, .medium))
        Button {
            print("Hello SHButton")
        } label: {
            Label("Hello SHButton", systemImage: "pencil")
        }
        .secondarySHStyle(font: .subtitle(.poppins, .medium))
        Button {
            print("Hello SHButton")
        } label: {
            Text("Hello SHButton")
        }
        .ghostSHStyle(font: .body(.poppins, .regular))
    }
}
