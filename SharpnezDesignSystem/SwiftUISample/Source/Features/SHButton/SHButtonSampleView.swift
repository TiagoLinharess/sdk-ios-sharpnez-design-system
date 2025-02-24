//
//  SHButtonSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 01/08/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHButtonSampleView: View {
    @State var isLoading: Bool = false
    @State var isDisabled: Bool = false
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHButton(
            title: "isLoading",
            style: .ghost(.primary(colorScheme: colorScheme)),
            font: .montserrat,
            action: actionLoading
        )
        SHButton(
            title: "isDisabled",
            style: .ghost(.primary(colorScheme: colorScheme)),
            font: .montserrat,
            action: actionDisabled
        )
        Spacer()
        SHButton(
            title: "Hello SHButton",
            icon: .card,
            style: .primary(.primary(colorScheme: colorScheme), .onPrimary(colorScheme: colorScheme)),
            font: .montserrat,
            isLoading: isLoading,
            isDisabled: isDisabled
        ) {
            print("Button 1 tapped")
        }
        SHButton(
            title: "Hello SHButton",
            style: .secondary(.primary(colorScheme: colorScheme)),
            font: .montserrat,
            isLoading: isLoading,
            isDisabled: isDisabled
        ) {
            print("Button 2 tapped")
        }
        SHButton(
            title: "Hello SHButton",
            style: .ghost(.primary(colorScheme: colorScheme)),
            font: .montserrat,
            isLoading: isLoading,
            isDisabled: isDisabled
        ) {
            print("Button 3 tapped")
        }
    }
    
    private func actionLoading() {
        isLoading.toggle()
    }
    
    private func actionDisabled() {
        isDisabled.toggle()
    }
}
