
//
//  SHContainerView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 14/11/24.
//

import SwiftUI

public struct SHContainerView<Content: View>: View {
    // MARK: Properties
    
    /// Container title
    private let title: String
    
    /// Title font
    private let font: DSFontName
    
    /// Content View
    @ViewBuilder private let content: Content
    
    // MARK: Init
    
    /// Init
    public init(title: String, font: DSFontName, @ViewBuilder content: () -> Content) {
        self.title = title
        self.font = font
        self.content = content()
    }
    
    // MARK: Body
    
    public var body: some View {
        VStack(spacing: .zero) {
            HStack {
                Text(title)
                    .configureWithSH(color: .onPrimarySH, font: .title2(font, .regular))
                    .padding(.horizontal, .small)
                    .padding(.bottom, .extraSmall)
                Spacer()
            }
            .background(Color.primarySH)
            ScrollView {
                VStack(spacing: .zero) {
                    Spacer().frame(height: .small)
                    content
                }
                .frame(maxWidth: .infinity)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.backgroundSH)
            .clipShape(.rect(topLeadingRadius: .medium, topTrailingRadius: .medium))
            .background(Color.primarySH)
            .ignoresSafeArea()
        }
    }
}
