//
//  SHLoadingSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHLoadingSampleView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        SHLoading(style: .large, color: .primary(colorScheme: colorScheme))
        SHLoading(style: .medium, color: .primary(colorScheme: colorScheme))
        SHLoading(style: .small, color: .primary(colorScheme: colorScheme))
        SHLoading(style: .nano, color: .primary(colorScheme: colorScheme))
    }
}
