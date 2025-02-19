
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
    
    /// Content View
    @ViewBuilder private let content: Content
    
    // MARK: Init
    
    /// Init
    public init(title: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.content = content()
    }
    
    // MARK: Body
    
    public var body: some View {
        content
            .toolbarRole(.editor)
            .background(Color.backgroundSH)
            .ignoresSafeArea()
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(title)
                            .foregroundStyle(Color.onBackgroundSH)
                            .font(.title3(.poppins, .medium))
                    }
                }
            }
    }
}
