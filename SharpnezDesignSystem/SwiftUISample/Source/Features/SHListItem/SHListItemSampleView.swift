//
//  SHListItemSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 18/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHListItemSampleView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHListItemView(
            items: [
                .init(title: "Item 1"),
                .init(title: "Item 2", isComplete: true),
                .init(title: "Item 3", isComplete: false)
            ],
            font: .body(.poppins, .regular),
            defaultColor: .onBackground(colorScheme: colorScheme)
        )
    }
}
