//
//  UISHShortcutButtonViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHShortcutButtonViewController: UIViewController {
    
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

extension UISHShortcutButtonViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHButton"
    }

    func setupHierarchy() {
        view.addSubview(stackView)
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

extension UISHShortcutButtonViewController {
    
    private func setupComponent() {
        let components: [UISHShortcutButton] = [
            .init(
                image: UIImage(systemName: "dollarsign") ?? UIImage(),
                text: "Button",
                font: .montserrat,
                color: .surfaceSH,
                onColor: .onSurfaceSH,
                action: {
                    print("action")
                }
            ),
            .init(
                image: UIImage(systemName: "creditcard") ?? UIImage(),
                text: "Button",
                font: .poppins,
                color: .surfaceSH,
                onColor: .onSurfaceSH,
                action: {
                    print("action")
                }
            )
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
