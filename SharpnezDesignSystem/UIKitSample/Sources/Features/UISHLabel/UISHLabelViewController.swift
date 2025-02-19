//
//  UISHLabelViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

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
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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
