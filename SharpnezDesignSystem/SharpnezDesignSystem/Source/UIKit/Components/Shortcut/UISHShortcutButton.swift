//
//  UISHShortcutButton.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import UIKit

public final class UISHShortcutButton: UIView {
    
    // MARK: Properteis
    
    /// Button Image
    public var image: UIImage {
        didSet { configure() }
    }
    
    /// Button text
    public var text: String {
        didSet { configure() }
    }
    
    /// Button font
    public var font: DSFontName {
        didSet { configure() }
    }
    
    /// Button color
    public var color: UIColor {
        didSet { configure() }
    }
    
    /// Button on color
    public var onColor: UIColor {
        didSet { configure() }
    }
    
    /// Button action closure
    public var action: (() -> Void)?
    
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
    
    /// Button init
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
        enableConstraints()
        
        NSLayoutConstraint.activate([
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: .extraSmall),
            iconView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .extraSmall),
            iconView.trailingAnchor.constraint(
                lessThanOrEqualTo: trailingAnchor,
                constant: -.extraSmall
            ),
            iconView.heightAnchor.constraint(equalToConstant: .big),
            iconView.widthAnchor.constraint(equalToConstant: .big),
        ])
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(
                greaterThanOrEqualTo: iconView.bottomAnchor,
                constant: .medium
            ),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .extraSmall),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.medium),
            textLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.extraSmall),
        ])
        
        NSLayoutConstraint.activate([
            self.heightAnchor.constraint(equalToConstant: .superGiant),
            self.widthAnchor.constraint(equalToConstant: .superGiant),
        ])
    }
    
    func configure() {
        isUserInteractionEnabled = true
        backgroundColor = color
        iconView.image = image
        iconView.tintColor = onColor
        textLabel.text = text
        textLabel.textColor = onColor
        layer.cornerRadius = .small
        layer.masksToBounds = true
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
