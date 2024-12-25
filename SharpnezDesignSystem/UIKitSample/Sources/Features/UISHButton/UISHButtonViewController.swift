//
//  UISHButtonViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

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
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        button.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(stackView.snp.bottom).offset(CGFloat.small)
            $0.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
        }
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
