//
//  FlavorColorsView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 12/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct FlavorColorsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text("primary")
                .foregroundStyle(Color.primarySH)
            Text("onPrimary")
                .foregroundStyle(Color.onPrimarySH)
                .background(Color.primarySH)
            Text("secondary")
                .foregroundStyle(Color.secondarySH)
            Text("onSecondary")
                .foregroundStyle(Color.onSecondarySH)
                .background(Color.secondarySH)
            Text("surface")
                .foregroundStyle(Color.surfaceSH)
            Text("onSurface")
                .foregroundStyle(Color.onSurfaceSH)
            Text("background")
                .foregroundStyle(Color.backgroundSH)
                .background(Color.onBackgroundSH)
            Text("onBackground")
                .foregroundStyle(Color.onBackgroundSH)
        }
    }
}
