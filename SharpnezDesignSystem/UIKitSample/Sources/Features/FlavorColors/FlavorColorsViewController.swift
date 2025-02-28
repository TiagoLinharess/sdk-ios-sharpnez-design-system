//
//  FlavorColors.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import UIKit

final class FlavorColorsViewController: UIViewController {
    
    struct Model {
        let title: String
        let color: UIColor
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

extension FlavorColorsViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .gray
        title = "Flavor Colors"
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

extension FlavorColorsViewController {
    
    private func setupColors() {
        let colors: [Model] = [
            .init(title: "primarySH", color: .primarySH),
            .init(title: "onPrimarySH", color: .onPrimarySH),
            .init(title: "secondarySH", color: .secondarySH),
            .init(title: "onSecondarySH", color: .onSecondarySH),
            .init(title: "backgroundSH", color: .backgroundSH),
            .init(title: "onBackgroundSH", color: .onBackgroundSH),
            .init(title: "surfaceSH", color: .surfaceSH),
            .init(title: "onSurfaceSH", color: .onSurfaceSH),
            .init(title: "successSH", color: .successSH),
            .init(title: "onSuccessSH", color: .onSuccessSH),
            .init(title: "warningSH", color: .warningSH),
            .init(title: "onWarningSH", color: .onWarningSH),
            .init(title: "errorSH", color: .errorSH),
            .init(title: "onErrorSH", color: .onErrorSH)
        ]
        
        let views = colors.map { color in
            let label = UILabel()
            label.text = color.title
            label.textColor = color.color
            return label
        }
        
        stackView.addArrangedSubviews(views)
    }
}
