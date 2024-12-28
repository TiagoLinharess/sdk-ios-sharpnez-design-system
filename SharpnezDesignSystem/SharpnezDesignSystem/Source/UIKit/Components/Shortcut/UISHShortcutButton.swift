//
//  UISHShortcutButton.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import SnapKit

public final class UISHShortcutButton: UIView {
    
    // MARK: Properteis
    
    public var image: UIImage {
        didSet { configure() }
    }
    
    public var text: String {
        didSet { configure() }
    }
    
    public var font: DSFontName {
        didSet { configure() }
    }
    
    public var color: UIColor {
        didSet { configure() }
    }
    
    public var onColor: UIColor {
        didSet { configure() }
    }
    
    public var action: (() -> Void)? {
        didSet { configureAction() }
    }
    
    // MARK: UI Elements
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = image
        imageView.tintColor = onColor
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var textLabel: UISHLabel = {
        let label =  UISHLabel(
            text: text,
            textColor: onColor,
            font: .caption(font, .bold)
        )
        label.numberOfLines = 2
        return label
    }()
    
    // MARK: Init
    
    public init(
        image: UIImage,
        text: String,
        font: DSFontName,
        color: UIColor,
        onColor: UIColor,
        action: (() -> Void)? = nil
    ) {
        self.image = image
        self.text = text
        self.font = font
        self.color = color
        self.onColor = onColor
        self.action = action
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension UISHShortcutButton {
    
    // MARK: Private methods
    
    func setup() {
        configure()
        configureAction()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupHierarchy() {
        addSubviews(iconView, textLabel)
    }
    
    func setupConstraints() {
        iconView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(CGFloat.extraSmall)
            $0.leading.equalToSuperview().inset(CGFloat.smaller)
            $0.height.width.equalTo(CGFloat.big)
        }
        
        textLabel.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(iconView.snp.bottom).offset(CGFloat.medium)
            $0.leading.equalToSuperview().inset(CGFloat.smaller)
            $0.bottom.equalToSuperview().inset(CGFloat.extraSmall)
            $0.trailing.equalToSuperview().inset(CGFloat.medium)
        }
        
        snp.makeConstraints {
            $0.height.width.equalTo(CGFloat.superGiant)
        }
    }
    
    func configure() {
        isUserInteractionEnabled = true
        backgroundColor = color
        iconView.image = image
        iconView.tintColor = onColor
        textLabel.text = text
        textLabel.textColor = onColor
        layer.cornerRadius = .big
        layer.masksToBounds = true
        layer.borderWidth = .two
        layer.borderColor = onColor.cgColor
    }
    
    func configureAction() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        addGestureRecognizer(gesture)
    }
    
    @objc
    func tapAction() {
        action?()
    }
}
