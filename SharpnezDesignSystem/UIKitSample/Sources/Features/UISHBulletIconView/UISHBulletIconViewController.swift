//
//  UISHBulletIconViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHBulletIconViewController: UIViewController, UIScrollViewDelegate {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.delegate = self
        return scrollView
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
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != .zero {
            scrollView.contentOffset.x = .zero
        }
    }
}

extension UISHBulletIconViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHIcon"
    }

    func setupHierarchy() {
        view.addSubviews(scrollView)
        scrollView.addSubview(stackView)
    }

    func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(CGFloat.small)
        }
        
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension UISHBulletIconViewController {
    
    private func setupComponent() {
        let components: [UISHBulletIconView] = [
            .init(
                iconBackgroundColor: .onBackgroundSH,
                iconColor: .backgroundSH,
                icon: .addProfile
            ),
            .init(
                iconBackgroundColor: .surfaceSH,
                iconColor: .onSurfaceSH,
                icon: .profile
            ),
        ]
        
        components.forEach {
            $0.tintColor = .primarySH
        }
        
        stackView.addArrangedSubviews(components)
    }
}
