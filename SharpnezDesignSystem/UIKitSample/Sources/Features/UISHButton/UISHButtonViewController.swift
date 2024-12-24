//
//  UISHButtonViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHButtonViewController: UIViewController {
    
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
        title = "Custom Fonts"
    }

    func setupHierarchy() {
        view.addSubview(stackView)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension UISHButtonViewController {
    
    private func setupComponent() {
        let components: [UISHButton] = [
            .init(
                style: .primary(.primarySH, .onPrimarySH),
                title: "Button",
                font: .body(.poppins, .medium),
                image: UIImage(systemName: "house")
            ) {
                print("action")
            },
            .init(
                style: .primary(.primarySH, .onPrimarySH),
                title: "Button",
                font: .body(.montserrat, .medium)
            ) {
                print("action")
            },
            .init(
                style: .secondary(.primarySH),
                title: "Button",
                font: .body(.montserrat, .medium)
            ) {
                print("action")
            },
            .init(
                style: .ghost(.primarySH),
                title: "Button",
                font: .body(.montserrat, .medium)
            ) {
                print("action")
            },
        ]
        
        components[1].isDisabled = true
        stackView.addArrangedSubviews(components)
    }
}
