//
//  SHFeedbackView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SwiftUI

public struct SHFeedbackView: View {
    // MARK: Properties
    
    /// Phone theme
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    /// Secondary action logic
    private var hasSecondaryAction: Bool {
        secondaryAction != nil && !secondaryButtonTitle.isEmpty
    }
    
    /// Feedback type
    private let type: SHFeedbackType
    
    /// Feedback title
    private let title: String
    
    /// Feedback description
    private let description: String
    
    /// Feedback primary button title
    private let primaryButtonTitle: String
    
    /// Feedback secondary button title
    private let secondaryButtonTitle: String
    
    /// Feedback primary action
    private let primaryAction: () -> Void
    
    /// Feedback secondary action
    private let secondaryAction: (() -> Void)?
    
    // MARK: Init
    
    /// Init without secondary action
    public init(
        type: SHFeedbackType,
        title: String,
        description: String,
        primaryButtonTitle: String,
        primaryAction: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.description = description
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryButtonTitle = String()
        self.primaryAction = primaryAction
        self.secondaryAction = nil
    }
    
    /// Init with secondary action
    public init(
        type: SHFeedbackType,
        title: String,
        description: String,
        primaryButtonTitle: String,
        secondaryButtonTitle: String,
        primaryAction: @escaping () -> Void,
        secondaryAction: @escaping () -> Void
    ) {
        self.type = type
        self.title = title
        self.description = description
        self.primaryButtonTitle = primaryButtonTitle
        self.secondaryButtonTitle = secondaryButtonTitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
    
    // MARK: Body
    
    public var body: some View {
        VStack(alignment: .center, spacing: .small) {
            Spacer().frame(height: .superGiant)
            SHIcon(icon: type.icon)
                .resizable()
                .frame(width: .superLarge, height: .superLarge)
                .foregroundStyle(type.color)
            Text(title)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .title2(.poppins, .medium)
                )
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Text(description)
                .configureWithSH(
                    color: .onBackground(colorScheme: colorScheme),
                    font: .subtitle(.montserrat, .regular)
                )
                .multilineTextAlignment(.center)
            Spacer()
            SHButton(
                title: primaryButtonTitle,
                style: .primary(
                            .primary(colorScheme: colorScheme),
                            .onPrimary(colorScheme: colorScheme)
                        ),
                font: .montserrat,
                action: primaryAction
            )
            if hasSecondaryAction {
                SHButton(
                    title: secondaryButtonTitle,
                    style: .secondary(.primary(colorScheme: colorScheme)),
                    font: .montserrat
                ) {
                    secondaryAction?()
                }
            }
        }
        .padding(.small)
        .background(Color.background(colorScheme: colorScheme).ignoresSafeArea())
    }
}

// MARK: FeedbackType

public enum SHFeedbackType {
    case success
    case warning
    case error
    case info(ColorScheme?)
    case custom(icon: SHIconType, iconColor: Color)
    
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
        case .custom(let icon, _):
            icon
        }
    }
    
    @MainActor
    var color: Color {
        switch self {
        case .success: .success()
        case .warning: .warning()
        case .error: .error()
        case .info(let colorScheme): .onBackground(colorScheme: colorScheme)
        case .custom(_, let color): color
        }
    }
}
