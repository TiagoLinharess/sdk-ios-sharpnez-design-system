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
    
    var body: some View {
        SHCurrencyField(title: "value", text: $value, color: .primarySH, font: .montserrat)
    }
}
