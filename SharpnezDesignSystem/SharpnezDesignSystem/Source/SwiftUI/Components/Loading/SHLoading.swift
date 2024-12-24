//
//  SHLoading.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SwiftUI

public struct SHLoading: View {
    // MARK: Properties
    
    /// Circle animation states
    @State private var isCircleRotating = true
    @State private var animateStart = false
    @State private var animateEnd = true
    
    /// Circle style
    private let style: SHLoadingStyle
    
    /// Circle color
    private let color: Color
    
    // MARK: Init
    
    public init (style: SHLoadingStyle, color: Color) {
        self.style = style
        self.color = color
    }
    
    // MARK: Body
    
    public var body: some View {
        ZStack {
            Circle()
                .trim(from: animateStart ? 1/3 : 1/9, to: animateEnd ? 2/5 : 1)
                .stroke(lineWidth: style.lineWidth)
                .rotationEffect(.degrees(isCircleRotating ? 360 : 0))
                .frame(width: style.size, height: style.size)
                .foregroundColor(color)
                .onAppear() {
                    DispatchQueue.main.async {
                        withAnimation(Animation
                            .linear(duration: 1)
                            .repeatForever(autoreverses: false)) {
                                self.isCircleRotating.toggle()
                            }
                        withAnimation(Animation
                            .linear(duration: 1)
                            .delay(0.5)
                            .repeatForever(autoreverses: true)) {
                                self.animateStart.toggle()
                            }
                        withAnimation(Animation
                            .linear(duration: 1)
                            .delay(1)
                            .repeatForever(autoreverses: true)) {
                                self.animateEnd.toggle()
                            }
                    }
                }
        }
    }
}

// MARK: Style

public enum SHLoadingStyle {
    case nano
    case small
    case medium
    case large
    
    var lineWidth: CGFloat {
        switch self {
        case .nano: .two
        case .small: .two
        case .medium: .nano
        case .large: .nano
        }
    }
    
    var size: CGFloat {
        switch self {
        case .nano: 20
        case .small: 40
        case .medium: 80
        case .large: 150
        }
    }
}
