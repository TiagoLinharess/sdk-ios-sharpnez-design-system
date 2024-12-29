//
//  UISHSampleViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

class ViewModel { }

final class UISHSampleViewController: UISHViewController<ViewModel> {
    
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

extension UISHSampleViewController: ViewCode {
    
    func setupView() {
        setDefaultHeader(title: "Example Controller")
    }

    func setupHierarchy() {
        scrollView.addSubview(stackView)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.verticalEdges.equalToSuperview()
            $0.centerX.equalToSuperview()
        }
    }
}

extension UISHSampleViewController {
    
    private func setupColors() {
        let labels: [UISHLabel] = [
            .init(text: "1", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "2", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "3", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "4", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "5", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "6", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "7", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "8", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "9", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "10", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "11", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "12", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "13", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "14", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "15", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "16", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "17", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "18", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "19", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "20", textColor: .primarySH, font: .title1(.poppins, .regular)),
            .init(text: "21", textColor: .primarySH, font: .title1(.poppins, .regular)),
        ]
        
        stackView.addArrangedSubviews(labels)
    }
}

