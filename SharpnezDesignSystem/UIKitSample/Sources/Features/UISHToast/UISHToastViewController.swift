//
//  UISHButtonViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHToastViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .small
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupComponent()
    }
}

extension UISHToastViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHToast"
    }

    func setupHierarchy() {
        view.addSubviews(stackView)
    }

    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UISHToastViewController {
    
    private func setupComponent() {
        let components: [UISHButton] = [
            .init(
                style: .ghost(.primarySH),
                title: "Show info toast",
                font: .poppins
            ) {
                self.showToast(type: .info, text: "info", font: .montserrat)
            },
            .init(
                style: .ghost(.primarySH),
                title: "Show error toast",
                font: .montserrat
            ) {
                self.showToast(type: .error, text: "error", font: .poppins)
            },
            .init(
                style: .ghost(.primarySH),
                title: "Show warning toast",
                font: .montserrat
            ) {
                self.showToast(type: .warning, text: "warning", font: .montserrat)
            },
            .init(
                style: .ghost(.primarySH),
                title: "Show success toast",
                font: .poppins
            ) {
                self.showToast(type: .success, text: "success containerHeight containerHeight containerHeight containerHeight containerHeight containerHeight", font: .poppins)
            },
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
