//
//  FlavorColorsView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 12/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct FlavorColorsView: View {
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            Text("primary")
                .foregroundStyle(Color.primary(colorScheme: colorScheme))
            Text("onPrimary")
                .foregroundStyle(Color.onPrimary(colorScheme: colorScheme))
                .background(Color.primary(colorScheme: colorScheme))
            Text("secondary")
                .foregroundStyle(Color.secondary(colorScheme: colorScheme))
            Text("onSecondary")
                .foregroundStyle(Color.onSecondary(colorScheme: colorScheme))
                .background(Color.secondary(colorScheme: colorScheme))
            Text("surface")
                .foregroundStyle(Color.surface(colorScheme: colorScheme))
            Text("onSurface")
                .foregroundStyle(Color.onSurface(colorScheme: colorScheme))
                .background(Color.surface(colorScheme: colorScheme))
            Text("background")
                .foregroundStyle(Color.background(colorScheme: colorScheme))
                .background(Color.onBackground(colorScheme: colorScheme))
            Text("onBackground")
                .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
            Text("success")
                .foregroundStyle(Color.success())
            Text("onSuccess")
                .foregroundStyle(Color.onSuccess())
                .background(Color.success())
            Text("warning")
                .foregroundStyle(Color.warning())
            Text("onWarning")
                .foregroundStyle(Color.onWarning())
                .background(Color.warning())
            Text("error")
                .foregroundStyle(Color.error())
            Text("error")
                .foregroundStyle(Color.onError())
                .background(Color.error())
        }
    }
}
