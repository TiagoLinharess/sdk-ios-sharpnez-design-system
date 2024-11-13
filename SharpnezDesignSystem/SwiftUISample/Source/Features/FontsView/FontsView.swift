//
//  FontsView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 13/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct FontsView: View {
    var body: some View {
        ScrollView {
            Spacer()
            VStack {
                Text("Hello World")
                    .font(.title1(.poppins, .bold))
                Text("Hello World")
                    .font(.title2(.poppins, .medium))
                Text("Hello World")
                    .font(.title3(.poppins, .regular))
                Text("Hello World")
                    .font(.subtitle(.poppins, .bold))
                Text("Hello World")
                    .font(.body(.poppins, .medium))
                Text("Hello World")
                    .font(.caption(.poppins, .regular))
            }
            VStack {
                Text("Hello World")
                    .font(.title1(.montserrat, .bold))
                Text("Hello World")
                    .font(.title2(.montserrat, .medium))
                Text("Hello World")
                    .font(.title3(.montserrat, .regular))
                Text("Hello World")
                    .font(.subtitle(.montserrat, .bold))
                Text("Hello World")
                    .font(.body(.montserrat, .medium))
                Text("Hello World")
                    .font(.caption(.montserrat, .regular))
            }
            Spacer()
        }
    }
}
