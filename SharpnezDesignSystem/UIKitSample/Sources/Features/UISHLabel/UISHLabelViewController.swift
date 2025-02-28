//
//  UISHLabelViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import UIKit

final class UISHLabelViewController: UIViewController {
    
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
        setupColors()
    }
}

extension UISHLabelViewController: ViewCode {
    
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
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension UISHLabelViewController {
    
    private func setupColors() {
        let labels: [UISHLabel] = [
            .init(text: "label1", textColor: .primarySH, font: .title1(.poppins, .bold)),
            .init(text: "label2", textColor: .secondarySH, font: .title2(.poppins, .medium)),
            .init(text: "label3", textColor: .surfaceSH, font: .title3(.poppins, .regular)),
            .init(text: "label4", textColor: .onBackgroundSH, font: .subtitle(.poppins, .regular)),
        ]
        
        stackView.addArrangedSubviews(labels)
    }
}
