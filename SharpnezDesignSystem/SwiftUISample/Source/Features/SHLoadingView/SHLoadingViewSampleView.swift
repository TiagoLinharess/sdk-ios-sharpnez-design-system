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
                    color: .primary(),
                    onColor: .onPrimary(),
                    firstText: "Loading",
                    font: .title3(.montserrat, .medium)
                )
            } label: {
                Text("Primary with one text")
            }
            NavigationLink {
                SHLoadingView(
                    color: .secondary(),
                    onColor: .onSecondary(),
                    firstText: "Loading",
                    secondText: "Finishing",
                    font: .title3(.montserrat, .medium)
                )
            } label: {
                Text("Secondary with two texts")
            }
            NavigationLink {
                SHLoadingView(color: .surface(), onColor: .onSurface())
            } label: {
                Text("Surface")
            }
            NavigationLink {
                SHLoadingView(color: .background(), onColor: .onBackground())
            } label: {
                Text("Background")
            }
            NavigationLink {
                SHLoadingView(color: .background(), onColor: .primary())
            } label: {
                Text("Background with primary")
            }
            .navigationTitle("Select color scheme")
        }
    }
}
