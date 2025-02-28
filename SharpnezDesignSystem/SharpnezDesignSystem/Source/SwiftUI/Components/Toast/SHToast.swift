//
//  SHToast.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 20/02/25.
//

import SwiftUI

// MARK: SHToastViewModel

public struct SHToastViewModel: Equatable {
    var style: SHToastType
    var font: DSFontName
    var message: String
    var duration: Double
    var width: Double
    
    public init(
        style: SHToastType,
        font: DSFontName,
        message: String,
        duration: Double = 3,
        width: Double = .infinity
    ) {
        self.style = style
        self.font = font
        self.message = message
        self.duration = duration
        self.width = width
    }
}

// MARK: SHToastType

public enum SHToastType {
    case error
    case warning
    case success
    case info
    
    /// Background color
    @MainActor
    var backgroundColor: Color {
        return switch self {
        case .info:
            .primary()
        case .success:
            .success()
        case .warning:
            .warning()
        case .error:
            .error()
        }
    }
    
    /// Color
    @MainActor
    var color: Color {
        return switch self {
        case .info:
            .onPrimary()
        case .success:
            .onSuccess()
        case .warning:
            .onWarning()
        case .error:
            .onError()
        }
    }
    
    /// Icon
    var icon: SHIconType {
        return switch self {
        case .success:
            .success
        case .warning:
            .warning
        case .error:
            .error
        case .info:
            .info
        }
    }
}

// MARK: SHToast

public struct SHToast: View {
    
    // MARK: Properties
    
    var style: SHToastType
    var font: DSFontName
    var message: String
    var width = CGFloat.infinity
    var onCancelTapped: (() -> Void)
    
    // MARK: Body
    
    public var body: some View {
        HStack(alignment: .center, spacing: .small) {
            SHIcon(icon: style.icon)
                .foregroundStyle(style.color)
            Text(message)
                .configureWithSH(color: style.color, font: .body(font, .medium))
                .lineLimit(3)
            Spacer()
        }
        .padding(.small)
        .background(style.backgroundColor)
        .frame(minWidth: .zero, maxWidth: width)
        .clipShape(.capsule)
        .overlay {
            Capsule()
                .stroke(style.backgroundColor, lineWidth: .one)
        }
        .padding(.horizontal, .small)
    }
}

// MARK: Modifier

struct ToastModifier: ViewModifier {
    
    @Binding var toast: SHToastViewModel?
    @State private var workItem: DispatchWorkItem?
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .overlay(
                ZStack {
                    mainToastView()
                        .offset(y: .xxBig)
                }.animation(.spring(), value: toast)
            )
            .onChange(of: toast) { value in
                showToast()
            }
    }
    
    @ViewBuilder func mainToastView() -> some View {
        if let toast = toast {
            VStack {
                SHToast(
                    style: toast.style,
                    font: toast.font,
                    message: toast.message,
                    width: toast.width
                ) {
                    dismissToast()
                }
                Spacer()
            }
        }
    }
    
    private func showToast() {
        guard let toast = toast else { return }
        
        UIImpactFeedbackGenerator(style: .light)
            .impactOccurred()
        
        if toast.duration > 0 {
            workItem?.cancel()
            
            let task = DispatchWorkItem {
                dismissToast()
            }
            
            workItem = task
            DispatchQueue.main.asyncAfter(deadline: .now() + toast.duration, execute: task)
        }
    }
    
    private func dismissToast() {
        withAnimation {
            toast = nil
        }
        
        workItem?.cancel()
        workItem = nil
    }
}

// MARK: Extension

public extension View {
    
    func toastView(toast: Binding<SHToastViewModel?>) -> some View {
        self.modifier(ToastModifier(toast: toast))
    }
}
