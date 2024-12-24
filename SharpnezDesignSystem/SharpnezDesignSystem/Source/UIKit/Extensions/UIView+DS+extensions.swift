//
//  UIView+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public extension UIView {
    
    /// Add subviews method
    func addSubviews(_ views: UIView...) {
        views.forEach { addSubview($0) }
    }
}
