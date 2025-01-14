//
//  UISHTextField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 27/12/24.
//

import SnapKit

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
        return UISHListItem(
            items: listItems,
            font: font,
            defaultColor: color
        )
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
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(CGFloat.small)
        }
        
        textField.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.extraSmall)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(CGFloat.xLarge)
            $0.width.greaterThanOrEqualTo(
                titleLabel.intrinsicContentSize.width + CGFloat.xxxLarge
            )
        }
        
        listItemView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(CGFloat.extraSmall)
            $0.horizontalEdges.bottom.equalToSuperview().inset(CGFloat.extraSmall)
        }
    }
    
    func setupAction() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }

    @objc func textFieldDidChange(_ textField: UITextField) {
        onChange?(textField)
    }
}
