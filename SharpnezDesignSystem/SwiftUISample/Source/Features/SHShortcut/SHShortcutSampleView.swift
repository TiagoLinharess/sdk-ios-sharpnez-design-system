//
//  SHButtonSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 01/08/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHShortcutSampleView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHShortcutButton(
            icon: .coin,
            label: "Add payment",
            font: .montserrat,
            color: .surface(colorScheme: colorScheme),
            onColor: .onSurface(colorScheme: colorScheme)
        ) {
            print("button")
        }
        SHShortcutButton(
            icon: .card,
            label: "Credit card",
            font: .montserrat,
            color: .surface(colorScheme: colorScheme),
            onColor: .onSurface(colorScheme: colorScheme)
        ) {
            print("button")
        }
        SHShortcutButton(
            icon: .budget,
            label: "Budgets",
            font: .montserrat,
            color: .surface(colorScheme: colorScheme),
            onColor: .onSurface(colorScheme: colorScheme)
        ) {
            print("button")
        }
    }
}
