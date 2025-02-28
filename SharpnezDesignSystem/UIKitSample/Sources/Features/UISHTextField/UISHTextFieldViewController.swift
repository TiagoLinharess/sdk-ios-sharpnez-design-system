//
//  UISHTextFieldViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 27/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHTextFieldViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .small
        stackView.backgroundColor = .clear
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var textField: UISHTextField = {
        return UISHTextField(
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

extension UISHTextFieldViewController: ViewCode {
    
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

extension UISHTextFieldViewController {
    
    private func setupComponent() {
        let components: [UISHTextField] = [
            .init(title: "TextField", font: .montserrat, color: .primarySH)
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
