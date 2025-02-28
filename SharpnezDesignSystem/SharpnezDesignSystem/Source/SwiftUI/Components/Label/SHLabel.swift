//
//  SHLabel.swift
//  DesignSystem
//
//  Created by Tiago Linhares on 26/07/23.
//

import SwiftUI

private struct SHLabelModifier: ViewModifier {
    // MARK: Properties
    
    /// Label color.
    private let color: Color
    
    /// Label font.
    private let font: Font
    
    // MARK: Init
    
    /// Init with Color and Font parameters.
    init(color: Color, font: Font) {
        self.font = font
        self.color = color
    }
    
    // MARK: Body
    
    /// Modifier body.
    func body(content: Content) -> some View {
        content
            .foregroundColor(color)
            .font(font)
            .truncationMode(.tail)
    }
}

extension Label {
    // MARK: Label Modifier Implementation
    
    /// Function for Color and Font parameters.
    @MainActor
    public func configureWithSH(color: Color, font: Font) -> some View {
        modifier(SHLabelModifier(color: color, font: font))
    }
}

extension Text {
    // MARK: Text Modifier Implementation
    
    /// Function for Color and Font parameters.
    @MainActor
    public func configureWithSH(color: Color, font: Font) -> some View {
        modifier(SHLabelModifier(color: color, font: font))
    }
}
