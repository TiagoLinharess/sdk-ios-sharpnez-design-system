
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
    
    /// Back button action
    @ViewBuilder private let backButtonAction: () -> Void
    
    /// Content View
    @ViewBuilder private let content: Content
    
    /// Phone theme
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    // MARK: Init
    
    /// Init
    public init(
        title: String,
        backButtonAction: @escaping () -> Void,
        @ViewBuilder content: () -> Content
    ) {
        self.title = title
        self.content = content()
        self.backButtonAction = backButtonAction
    }
    
    // MARK: Body
    
    public var body: some View {
        content
            .navigationBarBackButtonHidden()
            .toolbar(.visible)
            .toolbarRole(.editor)
            .background(Color.background(colorScheme: colorScheme).ignoresSafeArea())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Text(title)
                        .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                        .font(.subtitle(.poppins, .medium))
                }
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: backButtonAction) {
                        Image(systemName: "arrow.left")
                            .foregroundStyle(Color.onBackground(colorScheme: colorScheme))
                    }
                }
            }
    }
}
