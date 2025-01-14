//
//  UISHContainerView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 02/01/25.
//

import SnapKit

open class UISHContainerView: UIView {
    
    // MARK: UI Elements
    
    /// View scroll view
    public lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .backgroundSH
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        return scrollView
    }()
    
    public lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    /// Super class init
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
        scrollView.addSubview(contentView)
    }

    private func setupConstraints() {
        scrollView.snp.makeConstraints {
            $0.top.equalTo(safeAreaLayoutGuide)
            $0.horizontalEdges.bottom.equalToSuperview()
        }
        
        contentView.snp.makeConstraints {
            $0.edges.equalToSuperview()
            $0.width.equalTo(CGFloat.deviceWidth)
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
