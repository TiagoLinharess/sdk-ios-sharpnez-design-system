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
    
    var body: some View {
        SHButton(
            title: "isLoading",
            style: .ghost(.primarySH),
            font: .montserrat,
            action: actionLoading
        )
        SHButton(
            title: "isDisabled",
            style: .ghost(.primarySH),
            font: .montserrat,
            action: actionDisabled
        )
        Spacer()
        SHButton(
            title: "Hello SHButton",
            image: Image(systemName: "house"),
            style: .primary(.primarySH, .onPrimarySH),
            font: .montserrat,
            isLoading: isLoading,
            isDisabled: isDisabled
        ) {
            print("Button 1 tapped")
        }
        SHButton(
            title: "Hello SHButton",
            style: .secondary(.primarySH),
            font: .montserrat,
            isLoading: isLoading,
            isDisabled: isDisabled
        ) {
            print("Button 2 tapped")
        }
        SHButton(
            title: "Hello SHButton",
            style: .ghost(.primarySH),
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
