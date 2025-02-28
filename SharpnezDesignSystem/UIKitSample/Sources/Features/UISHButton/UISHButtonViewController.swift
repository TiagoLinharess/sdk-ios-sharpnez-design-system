//
//  UISHButtonViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHButtonViewController: UIViewController {
    
    private lazy var button: UISHButton = {
        let button = UISHButton(
            style: .primary(.secondarySH, .onSecondarySH),
            title: "Button",
            font: .montserrat,
            image: UIImage(systemName: "house")
        ) {
            print("action")
        }
        return button
    }()
    
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

extension UISHButtonViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHButton"
    }

    func setupHierarchy() {
        view.addSubviews(button, stackView)
    }

    func setupConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: .small),
            button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .small),
            button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.small),
            button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -.small),
        ])
    }
}

extension UISHButtonViewController {
    
    private func setupComponent() {
        let components: [UISHButton] = [
            .init(
                style: .primary(.primarySH, .onPrimarySH),
                title: "Button",
                font: .poppins
            ) {
                print("action")
            },
            .init(
                style: .primary(.primarySH, .onPrimarySH),
                title: "Button",
                font: .montserrat
            ) {
                print("action")
            },
            .init(
                style: .secondary(.primarySH),
                title: "Button",
                font: .montserrat
            ) {
                print("action")
            },
            .init(
                style: .ghost(.primarySH),
                title: "Change Loading State",
                font: .poppins
            ) {
                self.button.isLoading.toggle()
            },
        ]
        
        components[1].isDisabled = true
        stackView.addArrangedSubviews(components)
    }
}
