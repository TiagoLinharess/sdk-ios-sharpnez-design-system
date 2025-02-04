//
//  UISHButton.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SnapKit

public final class UISHButton: UIButton {
    
    // MARK: Button Style

    public enum ButtonStyle {
        case primary(UIColor, UIColor)
        case secondary(UIColor)
        case ghost(UIColor)
        
        /// Background color
        var backgroundColor: UIColor {
            switch self {
            case let .primary(backgroundColor, _):
                return backgroundColor
            default:
                return .clear
            }
        }
        
        /// Title color
        var titleColor: UIColor {
            switch self {
            case let .primary(_, foregroundColor):
                return foregroundColor
            case let .secondary(color), let .ghost(color):
                return color
            }
        }
        
        /// Border width
        var borderWidth: CGFloat {
            switch self {
            case .secondary:
                return .two
            default:
                return .zero
            }
        }
        
        /// Border color
        var borderColor: UIColor {
            switch self {
            case let .secondary(color):
                return color
            default:
                return .clear
            }
        }
    }
    
    // MARK: Properties
    
    /// Button style
    public var style: ButtonStyle {
        didSet { configure() }
    }
    
    /// Button title
    public var title: String {
        didSet { configure() }
    }
    
    /// Button font
    public var font: DSFontName {
        didSet { configure() }
    }
    
    /// Button image
    public var image: UIImage? {
        didSet { configure() }
    }
    
    /// Button is disabled
    public var isDisabled: Bool = false {
        didSet { configure() }
    }
    
    /// Button is loading
    public var isLoading: Bool = false {
        didSet { configureIsLoading() }
    }
    
    /// Button image
    public var action: (() -> Void)? {
        didSet { configureAction() }
    }
    
    // MARK: Init
    
    /// Button init
    public init(
        style: ButtonStyle,
        title: String,
        font: DSFontName,
        image: UIImage? = nil,
        action: (() -> Void)? = nil
    ) {
        self.style = style
        self.title = title
        self.font = font
        self.image = image
        self.action = action
        super.init(frame: .zero)
        configure()
        configureAction()
        configureHeight()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension UISHButton {
    
    // MARK: Private methods
    
    func configure() {
        var configuration: Configuration = {
            switch style {
            case .secondary:
                .plain()
            default:
                .filled()
            }
        }()
        
        configuration.buttonSize = .large
        configuration.cornerStyle = .capsule
        configuration.baseForegroundColor = style.titleColor
        configuration.background.strokeWidth = style.borderWidth
        configuration.background.strokeColor = style.borderColor
        configuration.baseBackgroundColor = style.backgroundColor
        configuration.imagePlacement = .leading
        configuration.imagePadding = .extraSmall
        configuration.image = image
        configuration.attributedTitle = AttributedString(
            title,
            attributes: AttributeContainer(
                [NSAttributedString.Key.font: UIFont.body(font, .medium)]
            )
        )
        
        self.configuration = configuration
        self.alpha = isDisabled ? 0.5 : 1
        self.accessibilityIdentifier = title
    }
    
    func configureIsLoading() {
        configuration?.showsActivityIndicator = isLoading
    }
    
    func configureHeight() {
        snp.makeConstraints { $0.height.equalTo(CGFloat.xxLarge) }
    }
    
    func configureAction() {
        addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    @objc
    func tapAction() {
        guard !isDisabled, !isLoading else { return }
        action?()
    }
}
