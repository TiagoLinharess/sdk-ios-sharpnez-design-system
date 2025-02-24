//
//  SHBulletIconSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHBulletIconSampleView: View {
    
    struct Icon: Identifiable {
        var id: UUID = UUID()
        let value: SHIconType
    }
    
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let icons: [Icon] = [
        .init(value: .addProfile),
        .init(value: .profile),
        .init(value: .product),
        .init(value: .bills),
        .init(value: .budget),
        .init(value: .card),
        .init(value: .coin),
        .init(value: .success),
        .init(value: .warning),
        .init(value: .info),
        .init(value: .error),
    ]
    
    var body: some View {
        List(icons) { icon in
            HStack(spacing: .small) {
                SHBulletIcon(
                    icon: icon.value,
                    color: .background(colorScheme: colorScheme),
                    backgroundColor: .onBackground(colorScheme: colorScheme)
                )
                Text(icon.value.rawValue)
            }
        }
    }
}
