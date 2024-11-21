//
//  SHLoadingViewSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SharpnezDesignSystem
import SwiftUI

struct SHLoadingViewSampleView: View {
    var body: some View {
        List {
            NavigationLink {
                SHLoadingView(
                    color: .primarySH,
                    onColor: .onPrimarySH,
                    firstText: "Loading",
                    font: .title3(.montserrat, .medium)
                )
            } label: {
                Text("Primary with one text")
            }
            NavigationLink {
                SHLoadingView(
                    color: .secondarySH,
                    onColor: .onSecondarySH,
                    firstText: "Loading",
                    secondText: "Finishing",
                    font: .title3(.montserrat, .medium)
                )
            } label: {
                Text("Secondary with two texts")
            }
            NavigationLink {
                SHLoadingView(color: .surfaceSH, onColor: .onSurfaceSH)
            } label: {
                Text("Surface")
            }
            NavigationLink {
                SHLoadingView(color: .backgroundSH, onColor: .onBackgroundSH)
            } label: {
                Text("Background")
            }
            NavigationLink {
                SHLoadingView(color: .backgroundSH, onColor: .primarySH)
            } label: {
                Text("Background with primary")
            }
            .navigationTitle("Select color scheme")
        }
    }
}
