//
//  SHIllustrationSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHIllustrationSampleView: View {
    
    struct Illustration: Identifiable {
        var id: UUID = UUID()
        let value: SHIllustrationType
    }
    
    let illustrations: [Illustration] = [
        .init(value: .biometry),
        .init(value: .pin),
        .init(value: .recover),
        .init(value: .security)
    ]
    
    var body: some View {
        List(illustrations) { illustration in
            HStack(spacing: .small) {
                SHIllustration(illustration: illustration.value)
                    .foregroundStyle(Color.primarySH)
                Text(illustration.value.rawValue)
            }
        }
    }
}
