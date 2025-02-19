//
//  UIStackView+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public extension UIStackView {
    
    /// Add arranged subviews method
    func addArrangedSubviews(_ views: [UIView]) {
        views.forEach { addArrangedSubview($0) }
    }
    
    /// Add arranged subviews method
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
    
    /// Remove subview
    func removeFully(view: UIView) {
        removeArrangedSubview(view)
        view.removeFromSuperview()
    }
    
    /// Remove all subviews
    func removeFullyAllArrangedSubviews() {
        arrangedSubviews.forEach { removeFully(view: $0) }
    }
}
