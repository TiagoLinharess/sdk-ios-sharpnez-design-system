//
//  SHCurrencyFieldSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHCurrencyFieldSampleView: View {
    @State var value = ""
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHCurrencyField(
            title: "value",
            text: $value,
            color: .primary(colorScheme: colorScheme),
            font: .montserrat
        )
    }
}
