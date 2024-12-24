//
//  UISHLoading.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import NVActivityIndicatorView
import SnapKit

public final class UISHLoading: UIView {
    
    // MARK: Properties
    
    /// Loading color
    public var color: UIColor {
        didSet { configure() }
    }
    
    /// Loading size
    public var size: CGFloat {
        didSet { configure() }
    }
    
    // MARK: Init
    
    public init(color: UIColor, size: CGFloat) {
        self.color = color
        self.size = size
        super.init(frame: .zero)
        configure()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension UISHLoading {
    
    // MARK: Private methods
    
    func configure() {
        subviews.forEach { $0.removeFromSuperview() }
        
        let activityIndicator = NVActivityIndicatorView(
            frame: CGRect(x: .zero, y: .zero, width: size, height: size),
            type: .circleStrokeSpin,
            color: color
        )
        
        addSubview(activityIndicator)
        activityIndicator.startAnimating()
        activityIndicator.snp.makeConstraints { $0.edges.equalToSuperview() }
    }
}
