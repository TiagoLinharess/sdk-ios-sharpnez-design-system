//
//  ViewCode.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

public protocol ViewCode {
    func setup()
    func setupView()
    func setupHierarchy()
    func setupConstraints()
    func setupBinding()
    func setupAnimations()
    func setupActions()
}

public extension ViewCode {
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
        setupBinding()
        setupAnimations()
        setupActions()
    }
    
    func setupBinding() { /* not mandatory */ }
    
    func setupAnimations() { /* not mandatory */ }
    
    func setupActions() { /* not mandatory */ }
}
