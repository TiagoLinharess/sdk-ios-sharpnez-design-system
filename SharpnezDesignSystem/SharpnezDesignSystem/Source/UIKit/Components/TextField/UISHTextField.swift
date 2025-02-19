//
//  UISHTextField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 27/12/24.
//

import UIKit

public final class UISHTextField: UIView {
    
    // MARK: Properties
    
    /// Textfield text
    public var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    /// Textfield content type
    public var contentType: UITextContentType {
        get { textField.textContentType }
        set { textField.textContentType = newValue }
    }
    
    /// Textfield keyboard type
    public var keyboardType: UIKeyboardType {
        get { textField.keyboardType }
        set { textField.keyboardType = newValue }
    }
    
    /// Textfield auto capitalization type
    public var autocapitalizationType: UITextAutocapitalizationType {
        get { textField.autocapitalizationType }
        set { textField.autocapitalizationType = newValue }
    }
    
    /// Textfield label title
    public var title: String {
        didSet { titleLabel.text = title }
    }
    
    /// Textfield font
    public var font: DSFontName {
        didSet { configure() }
    }
    
    /// Textfield color
    public var color: UIColor {
        didSet { configure() }
    }
    
    /// Textfield on change closure
    public var onChange: ((UITextField) -> Void)?
    
    /// Textfield list items
    private var listItems: [UISHListItemViewModel]
    
    /// List items height constraint constant
    private lazy var listItemsHeightZeroConstraintConstant = listItemView
        .heightAnchor
        .constraint(equalToConstant: .zero)
    
    /// List items top constraint constant
    private lazy var listItemsTopConstraint = listItemView
        .topAnchor
        .constraint(equalTo: textField.bottomAnchor)
    
    // MARK: UI Elements
    
    private lazy var titleLabel: UISHLabel = {
        let label = UISHLabel(
            text: title,
            textColor: color,
            font: .body(font, .medium)
        )
        label.numberOfLines = 1
        return label
    }()
    
    /// Textfield
    public lazy var textField: UITextField = {
        let field = PrivateTextField()
        let view = UIView(frame: CGRect(x: .zero, y: .zero, width: .smaller, height: .two))
        field.leftView = view
        field.rightView = view
        field.leftViewMode = .always
        field.rightViewMode = .always
        field.layer.cornerRadius = .smaller
        field.layer.borderWidth = .two
        return field
    }()
    
    private lazy var listItemView: UISHListItem = {
        let view = UISHListItem(
            items: listItems,
            font: font,
            defaultColor: color
        )
        return view
    }()
    
    // MARK: Init
    
    /// Texfield init
    public init(
        title: String,
        font: DSFontName,
        color: UIColor,
        listItems: [UISHListItemViewModel] = []
    ) {
        self.title = title
        self.font = font
        self.color = color
        self.listItems = listItems
        super.init(frame: .zero)
        setup()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Public methods
    
    /// Update items method
    public func updateListItems(_ items: [UISHListItemViewModel]) {
        updateListItemConstants()
        listItems = items
        listItemView.items = listItems
    }
}

private extension UISHTextField {
    
    // MARK: Private methods
    
    func setup() {
        configure()
        setupHierarchy()
        setupConstraints()
        setupAction()
    }
    
    func configure() {
        accessibilityIdentifier = title
        backgroundColor = .clear
        textField.textColor = color
        textField.font = .body(font, .medium)
        textField.layer.borderColor = color.cgColor
        titleLabel.font = .body(font, .medium)
        titleLabel.textColor = color
    }
    
    func setupHierarchy() {
        addSubviews(titleLabel, textField, listItemView)
    }
    
    func setupConstraints() {
        enableConstraints()
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .small),
            titleLabel.trailingAnchor.constraint(
                lessThanOrEqualTo: trailingAnchor,
                constant: -.small
            )
        ])
        
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: .extraSmall),
            textField.leadingAnchor.constraint(equalTo: leadingAnchor),
            textField.trailingAnchor.constraint(equalTo: trailingAnchor),
            textField.heightAnchor.constraint(equalToConstant: .xLarge),
            textField.widthAnchor.constraint(
                greaterThanOrEqualToConstant: titleLabel.intrinsicContentSize.width + .xxxLarge
            )
        ])
        
        NSLayoutConstraint.activate([
            listItemsTopConstraint,
            listItemView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .extraSmall),
            listItemView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.extraSmall),
            listItemView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    
        updateListItemConstants()
    }
    
    func updateListItemConstants() {
        listItemsTopConstraint.constant = listItems.isEmpty ? .zero : .extraSmall
        listItemsHeightZeroConstraintConstant.isActive = listItems.isEmpty
    }
    
    func setupAction() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        onChange?(textField)
    }
}
