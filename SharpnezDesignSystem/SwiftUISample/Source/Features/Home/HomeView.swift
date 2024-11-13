//
//  HomeView.swift
//  SwiftUISample
//
//  Created by Tiago Linhares on 13/11/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(SampleItem.samples) { sample in
                    NavigationLink {
                        AnyView(sample.view)
                    } label: {
                        Text(sample.name)
                    }
                    .navigationTitle("SwiftUI Samples")
                }
            }
        }
    }
}
