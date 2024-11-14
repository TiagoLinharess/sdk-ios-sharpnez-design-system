//
//  SHShortcutButton.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 13/11/24.
//

import SwiftUI

public struct SHShortcutButton: View {
    // MARK: - Properties
    
    let image: String
    let label: String
    let font: DSFontName
    let action: () -> Void
    
    // MARK: - Init
    
    public init(image: String, label: String, font: DSFontName, action: @escaping () -> Void) {
        self.image = image
        self.label = label
        self.font = font
        self.action = action
    }
    
    // MARK: - Body
    
    public var body: some View {
        HStack(spacing: .zero) {
            VStack(alignment: .leading, spacing: .zero) {
                Image(systemName: image)
                    .renderingMode(.template)
                    .foregroundStyle(Color.onSuccessSH)
                    .padding([.leading, .top], .smaller)
                Spacer()
                Text(label)
                    .configureWithSH(color: .onSurfaceSH, font: .caption(font, .medium))
                    .lineLimit(2)
                    .padding([.leading, .bottom], .smaller)
            }
            Spacer()
        }
        .frame(width: 100, height: 100)
        .background(Color.surfaceSH)
        .clipShape(.buttonBorder)
        .onTapGesture(perform: action)
    }
}
