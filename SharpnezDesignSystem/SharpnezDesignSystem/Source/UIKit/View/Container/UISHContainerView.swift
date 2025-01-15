//
//  UISHContainerView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 02/01/25.
//

import SnapKit

open class UISHContainerView: UIView {
    
    // MARK: Init
    
    /// Super class init
    public init() {
        super.init(frame: .zero)
        setup()
    }

    required public init?(coder: NSCoder) { nil }
}

private extension UISHContainerView {
    
    // MARK: View Code
    
    private func setup() {
        setupView()
    }
    
    private func setupView() {
        backgroundColor = .backgroundSH
    }
}
