//
//  UISHPasswordFieldViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHPasswordFieldViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .small
        stackView.backgroundColor = .clear
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var textField: UISHPasswordField = {
        return UISHPasswordField(
            title: "Example",
            font: .montserrat,
            color: .primarySH,
            listItems: [
                .init(title: "aaaaaaaa", isComplete: false),
                .init(title: "bbbbbbbb", isComplete: true),
                .init(title: "cccccccc")
            ]
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupComponent()
    }
}

extension UISHPasswordFieldViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHButton"
    }

    func setupHierarchy() {
        view.addSubviews(stackView, textField)
    }

    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: .small),
            textField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small),
            textField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small),
            textField.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -.small),
        ])
    }
}

extension UISHPasswordFieldViewController {
    
    private func setupComponent() {
        let components: [UISHPasswordField] = [
            .init(title: "Password Field", font: .montserrat, color: .primarySH)
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
