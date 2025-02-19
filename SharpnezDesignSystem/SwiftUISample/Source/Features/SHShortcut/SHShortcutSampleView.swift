//
//  SHButtonSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 01/08/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHShortcutSampleView: View {
    var body: some View {
        SHShortcutButton(
            icon: .coin,
            label: "Add payment",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
        SHShortcutButton(
            icon: .card,
            label: "Credit card",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
        SHShortcutButton(
            icon: .budget,
            label: "Budgets",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
    }
}
