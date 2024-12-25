//
//  UISHLoadingViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHLoadingViewController: UIViewController {
    
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

extension UISHLoadingViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHLoading"
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

extension UISHLoadingViewController {
    
    private func setupComponent() {
        let components: [UISHLoading] = [
            .init(color: .primarySH, style: .large),
            .init(color: .primarySH, style: .medium)
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
