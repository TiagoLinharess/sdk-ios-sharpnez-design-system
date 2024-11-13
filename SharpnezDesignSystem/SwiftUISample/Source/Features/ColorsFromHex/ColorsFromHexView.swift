//
//  ColorsFromHexView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 12/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct ColorsFromHexView: View {
    var body: some View {
        VStack {
            Text("This sample are available in UIKit an SwiftUI Frameworks, check the docs.\n\nThis is an a example of colors using hex strings.\n\nAlso the background color are a custom hex color too.")
                .foregroundColor(UIColor.lightContent.color)
            Spacer()
            VStack {
                Text("Example of red")
                    .foregroundColor(UIColor.red100.color)
                Spacer()
                Text("Example of blue")
                    .foregroundColor(UIColor.blue.color)
                Spacer()
                Text("Example of purple")
                    .foregroundColor(UIColor.purple100.color)
                Spacer()
                Text("Example of green")
                    .foregroundColor(UIColor.green100.color)
                Spacer()
                Text("Example of yellow")
                    .foregroundColor(UIColor.yellow100.color)
            }
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(UIColor.darkContent.color)
    }
}
