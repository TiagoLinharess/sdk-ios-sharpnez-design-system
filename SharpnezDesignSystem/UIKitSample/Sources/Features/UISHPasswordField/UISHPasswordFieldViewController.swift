//
//  UISHPasswordFieldViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHPasswordFieldViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .small
        stackView.backgroundColor = .clear
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var textField: UISHPasswordField = {
        return UISHPasswordField(
            title: "Example",
            font: .montserrat,
            color: .primarySH,
            listItems: [
                .init(title: "aaaaaaaa", isComplete: false),
                .init(title: "bbbbbbbb", isComplete: true),
                .init(title: "cccccccc")
            ]
        )
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupComponent()
    }
}

extension UISHPasswordFieldViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHButton"
    }

    func setupHierarchy() {
        view.addSubviews(stackView, textField)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
        
        textField.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(stackView.snp.bottom).offset(CGFloat.small)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
            $0.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension UISHPasswordFieldViewController {
    
    private func setupComponent() {
        let components: [UISHPasswordField] = [
            .init(title: "Password Field", font: .montserrat, color: .primarySH)
        ]
        
        stackView.addArrangedSubviews(components)
    }
}
