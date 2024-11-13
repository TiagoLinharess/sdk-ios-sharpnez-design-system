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
            Text("This sample are available in UIKit an SwiftUI Frameworks, check the docs.")
            Spacer()
            VStack {
                Text("Hello World")
                    .font(UIFont.title1(.poppins, .bold).font)
                Text("Hello World")
                    .font(UIFont.title2(.poppins, .medium).font)
                Text("Hello World")
                    .font(UIFont.title3(.poppins, .regular).font)
                Text("Hello World")
                    .font(UIFont.subtitle(.poppins, .bold).font)
                Text("Hello World")
                    .font(UIFont.body(.poppins, .medium).font)
                Text("Hello World")
                    .font(UIFont.caption(.poppins, .regular).font)
            }
            VStack {
                Text("Hello World")
                    .font(UIFont.title1(.montserrat, .bold).font)
                Text("Hello World")
                    .font(UIFont.title2(.montserrat, .medium).font)
                Text("Hello World")
                    .font(UIFont.title3(.montserrat, .regular).font)
                Text("Hello World")
                    .font(UIFont.subtitle(.montserrat, .bold).font)
                Text("Hello World")
                    .font(UIFont.body(.montserrat, .medium).font)
                Text("Hello World")
                    .font(UIFont.caption(.montserrat, .regular).font)
            }
            Spacer()
        }
    }
}
