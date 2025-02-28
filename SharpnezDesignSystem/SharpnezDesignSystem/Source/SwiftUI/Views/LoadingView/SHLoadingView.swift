//
//  SHLoadingView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SwiftUI

public struct SHLoadingView: View {
    // MARK: Properties
    
    /// Has text logic
    private var hasText: Bool {
        !firstText.isEmpty
    }
    
    /// View color
    private let color: Color
    
    /// Loading color
    private let onColor: Color
    
    /// First label text
    private let firstText: String
    
    /// Second label text
    private let secondText: String
    
    /// Text fonts
    private let font: Font?
    
    /// Text state
    @State private var text: String = String()
    
    // MARK: Init
    
    /// Init without text
    public init(
        color: Color,
        onColor: Color
    ) {
        self.color = color
        self.onColor = onColor
        self.firstText = String()
        self.secondText = String()
        self.font = nil
    }
    
    /// Init with only first text
    public init(
        color: Color,
        onColor: Color,
        firstText: String,
        font: Font
    ) {
        self.color = color
        self.onColor = onColor
        self.firstText = firstText
        self.secondText = String()
        self.font = font
    }
    
    /// Init with all texts
    public init(
        color: Color,
        onColor: Color,
        firstText: String,
        secondText: String,
        font: Font
    ) {
        self.color = color
        self.onColor = onColor
        self.firstText = firstText
        self.secondText = secondText
        self.font = font
    }
    
    // MARK: Body
    
    public var body: some View {
        VStack(spacing: .small) {
            SHLoading(style: .large, color: onColor)
            if let font, hasText {
                Text(text)
                    .configureWithSH(color: onColor, font: font)
                    .onAppear(perform: handleText)
                    .lineLimit(2)
                    .multilineTextAlignment(.center)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(color)
    }
    
    // MARK: Private Methods
    
    private func handleText() {
        Task {
            try? await Task.sleep(for: Duration.seconds(0.2))
            withAnimation {
                text = firstText
            }
            if !secondText.isEmpty {
                try? await Task.sleep(for: Duration.seconds(2))
                withAnimation {
                    text = secondText
                }
            }
        }
    }
}
