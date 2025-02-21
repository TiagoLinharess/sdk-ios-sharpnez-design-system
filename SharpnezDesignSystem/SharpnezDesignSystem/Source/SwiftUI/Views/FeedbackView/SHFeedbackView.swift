//
//  SHFeedbackView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SwiftUI

public struct SHFeedbackView: View {
    // MARK: Properties
    
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
                .configureWithSH(color: .onBackgroundSH, font: .title2(.poppins, .medium))
                .lineLimit(2)
            Text(description)
                .configureWithSH(color: .onBackgroundSH, font: .subtitle(.montserrat, .regular))
            Spacer()
            SHButton(
                title: primaryButtonTitle,
                style: .primary(.primarySH, .onPrimarySH),
                font: .montserrat,
                action: primaryAction
            )
            if hasSecondaryAction {
                SHButton(
                    title: secondaryButtonTitle,
                    style: .secondary(.primarySH),
                    font: .montserrat
                ) {
                    secondaryAction?()
                }
            }
        }
        .padding(.small)
        .background(Color.backgroundSH.ignoresSafeArea())
    }
}

// MARK: FeedbackType

public enum SHFeedbackType {
    case success
    case warning
    case error
    case info
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
    
    var color: Color {
        switch self {
        case .success: .successSH
        case .warning: .warningSH
        case .error: .errorSH
        case .info: .onBackgroundSH
        case .custom(_, let color): color
        }
    }
}
