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
            image: "dollarsign",
            label: "Budgets",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
        SHShortcutButton(
            image: "creditcard",
            label: "Budgets",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
        SHShortcutButton(
            image: "calendar.day.timeline.left",
            label: "Budgets",
            font: .montserrat,
            color: .surfaceSH,
            onColor: .onSurfaceSH
        ) {
            print("button")
        }
    }
}
