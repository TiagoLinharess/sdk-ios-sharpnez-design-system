//
//  UISHContainerView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 02/01/25.
//

import SnapKit

open class UISHContainerView: UIView {
    
    // MARK: UI Elements
    
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .backgroundSH
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    public init() {
        super.init(frame: .zero)
        setup()
    }

    required public init?(coder: NSCoder) { nil }
}

private extension UISHContainerView {
    
    // MARK: View Code
    
    private func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = .backgroundSH
    }

    private func setupHierarchy() {
        addSubview(scrollView)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
    }
}

extension UISHContainerView: UIScrollViewDelegate {
    
    // MARK: UIScrollViewDelegate
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x != .zero {
            scrollView.contentOffset.x = .zero
        }
    }
}
