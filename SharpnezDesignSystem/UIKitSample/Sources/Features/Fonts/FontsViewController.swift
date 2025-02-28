//
//  FontsViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import UIKit

final class FontsViewController: UIViewController {
    
    struct Model {
        let title: String
        let font: UIFont
    }
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupColors()
    }
}

extension FontsViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "Custom Fonts"
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

extension FontsViewController {
    
    private func setupColors() {
        let fonts: [Model] = [
            .init(title: "poppins", font: .title1(.poppins, .bold)),
            .init(title: "poppins", font: .title2(.poppins, .medium)),
            .init(title: "poppins", font: .title3(.poppins, .regular)),
            .init(title: "poppins", font: .subtitle(.poppins, .bold)),
            .init(title: "poppins", font: .body(.poppins, .medium)),
            .init(title: "poppins", font: .caption(.poppins, .regular)),
            .init(title: "montserrat", font: .title1(.montserrat, .bold)),
            .init(title: "montserrat", font: .title2(.montserrat, .medium)),
            .init(title: "montserrat", font: .title3(.montserrat, .regular)),
            .init(title: "montserrat", font: .subtitle(.montserrat, .bold)),
            .init(title: "montserrat", font: .body(.montserrat, .medium)),
            .init(title: "montserrat", font: .caption(.montserrat, .regular)),
        ]
        
        let views = fonts.map { font in
            let label = UILabel()
            label.text = font.title
            label.font = font.font
            label.textColor = .onBackgroundSH
            return label
        }
        
        stackView.addArrangedSubviews(views)
    }
}
