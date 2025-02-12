//
//  UISHBulletIconView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 08/02/25.
//

import SnapKit

public final class UISHBulletIconView: UIView {
    
    // MARK: Properties
    
    /// Icon background color
    public var iconBackgroundColor: UIColor {
        didSet { backgroundColor = iconBackgroundColor }
    }
    
    /// Icon tint color
    public var iconColor: UIColor {
        didSet { imageView.tintColor = iconColor }
    }
    
    /// Bullet icon
    public var icon: UISHIcon {
        didSet { imageView.setIcon(icon) }
    }
    
    // MARK: UI elements
    
    private lazy var imageView: UISHIconView = {
        let imageView = UISHIconView(icon: icon)
        imageView.tintColor = iconColor
        return imageView
    }()
    
    // MARK: Init
    
    /// Bullet icon init
    public init(
        iconBackgroundColor: UIColor,
        iconColor: UIColor,
        icon: UISHIcon
    ) {
        self.iconBackgroundColor = iconBackgroundColor
        self.iconColor = iconColor
        self.icon = icon
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
}

private extension UISHBulletIconView {
    
    // MARK: View code
    
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupView() {
        backgroundColor = iconBackgroundColor
        layer.masksToBounds = true
        layer.cornerRadius = CGFloat.big
    }
    
    func setupHierarchy() {
        addSubview(imageView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(CGFloat.smaller)
            $0.height.width.equalTo(CGFloat.big)
        }
    }
}
