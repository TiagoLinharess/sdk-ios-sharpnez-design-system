//
//  SHPinCodeSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHPinCodeSampleView: View {
    
    /// Phone theme
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHPinCode(color: .primary(colorScheme: colorScheme)) { value in
            print(value)
        }
    }
}
