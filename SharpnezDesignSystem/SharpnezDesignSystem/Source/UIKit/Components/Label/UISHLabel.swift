//
//  UISHLabel.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public final class UISHLabel: UILabel {
    
    // MARK: Init
    
    /// Label init
    public init(text: String, textColor: UIColor, font: UIFont) {
        super.init(frame: .zero)
        self.textColor = textColor
        self.font = font
        self.text = text
        self.numberOfLines = .zero
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}
