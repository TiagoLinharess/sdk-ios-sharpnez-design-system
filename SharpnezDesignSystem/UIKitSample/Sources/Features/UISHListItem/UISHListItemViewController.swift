//
//  UISHListItemViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHListItemViewController: UIViewController {
    
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
        setupComponents()
    }
}

extension UISHListItemViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHLabel"
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
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.bottomAnchor)
        ])
    }
}

extension UISHListItemViewController {
    
    private func setupComponents() {
        let view = UISHListItem(
            items: [
                .init(title: "Completed item", isComplete: true),
                .init(title: "Not completed item", isComplete: false),
                .init(title: "Default item")
            ],
            font: .poppins,
            defaultColor: .primarySH
        )
        
        stackView.addArrangedSubviews(view)
    }
}
