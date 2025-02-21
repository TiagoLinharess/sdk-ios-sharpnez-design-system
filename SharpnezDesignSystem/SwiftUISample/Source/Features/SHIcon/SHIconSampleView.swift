//
//  SHIconSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHIconSampleView: View {
    
    struct Icon: Identifiable {
        var id: UUID = UUID()
        let value: SHIconType
    }
    
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
                SHIcon(icon: icon.value)
                    .foregroundStyle(Color.primarySH)
                Text(icon.value.rawValue)
            }
        }
    }
}
