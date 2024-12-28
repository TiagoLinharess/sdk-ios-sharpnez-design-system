//
//  UISHListItemViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/12/24.
//

import SharpnezDesignSystem
import SnapKit

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
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.lessThanOrEqualTo(view.safeAreaLayoutGuide.snp.bottom)
        }
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
