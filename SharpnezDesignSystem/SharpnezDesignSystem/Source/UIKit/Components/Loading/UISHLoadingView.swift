//
//  UISHLoadingView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SnapKit

public final class UISHLoadingView: UIView {
    
    // MARK: Properties
    
    /// Loading color
    public var color: UIColor {
        didSet { configure() }
    }
    
    /// Loading style
    public var style: UIActivityIndicatorView.Style {
        didSet { configure() }
    }
    
    // MARK: UI Elements
    
    private lazy var loadingView: UIActivityIndicatorView = {
        let view = UIActivityIndicatorView(style: style)
        view.color = color
        view.startAnimating()
        return view
    }()
    
    // MARK: Init
    
    public init(color: UIColor, style: UIActivityIndicatorView.Style) {
        self.color = color
        self.style = style
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension UISHLoadingView {
    
    // MARK: Private methods
    
    func setup() {
        addSubview(loadingView)
        loadingView.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
    
    func configure() {
        loadingView.color = color
        loadingView.style = style
    }
}
