//
//  SHFeedbackView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/11/24.
//

import SwiftUI

public struct SHFeedbackView: View {
    // MARK: - Properties
    
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
    
    // MARK: - Init
    
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
    
    // MARK: - Body
    
    public var body: some View {
        VStack(alignment: .leading, spacing: .small) {
            type.icon
                .font(.system(size: .superLarge))
                .foregroundStyle(type.color)
            Text(title)
                .configureWithSH(color: .onBackgroundSH, font: .title2(.poppins, .regular))
                .lineLimit(2)
            Text(description)
                .configureWithSH(color: .onBackgroundSH, font: .body(.montserrat, .regular))
                .lineLimit(2)
            Spacer()
            SHButton(
                title: primaryButtonTitle,
                style: .primary(.primarySH, .onPrimarySH),
                font: .body(.montserrat, .regular),
                action: primaryAction
            )
            if hasSecondaryAction {
                SHButton(
                    title: secondaryButtonTitle,
                    style: .secondary(.primarySH),
                    font: .body(.montserrat, .regular)
                ) {
                    secondaryAction?()
                }
            }
        }
        .padding(.small)
    }
}

// MARK: - FeedbackType

public enum SHFeedbackType {
    case success
    case warning
    case error
    case info
    case custom(image: Image, imageColor: Color)
    
    var icon: Image {
        switch self {
        case .success:
            Image(systemName: DSConstants.Icons.checkmarkCircleFill)
        case .warning:
            Image(systemName: DSConstants.Icons.exclamationmarkTriangleFill)
        case .error:
            Image(systemName: DSConstants.Icons.exclamationmarkOctagonFill)
        case .info:
            Image(systemName: DSConstants.Icons.infoCircleFill)
        case .custom(let image, _):
            image
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
