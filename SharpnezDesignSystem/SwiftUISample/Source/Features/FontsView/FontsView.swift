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
                Text("poppins")
                    .font(.title1(.poppins, .bold))
                Text("poppins")
                    .font(.title2(.poppins, .medium))
                Text("poppins")
                    .font(.title3(.poppins, .regular))
                Text("poppins")
                    .font(.subtitle(.poppins, .bold))
                Text("poppins")
                    .font(.body(.poppins, .medium))
                Text("poppins")
                    .font(.caption(.poppins, .regular))
            }
            VStack {
                Text("montserrat")
                    .font(.title1(.montserrat, .bold))
                Text("montserrat")
                    .font(.title2(.montserrat, .medium))
                Text("montserrat")
                    .font(.title3(.montserrat, .regular))
                Text("montserrat")
                    .font(.subtitle(.montserrat, .bold))
                Text("montserrat")
                    .font(.body(.montserrat, .medium))
                Text("montserrat")
                    .font(.caption(.montserrat, .regular))
            }
            Spacer()
        }
    }
}
