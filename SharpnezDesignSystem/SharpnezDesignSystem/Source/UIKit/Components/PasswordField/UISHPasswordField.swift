//
//  UISHPasswordField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 27/12/24.
//

import SnapKit

public final class UISHPasswordField: UIView {
    
    // MARK: Properties
    
    public var text: String? {
        get { textField.text }
        set { textField.text = newValue }
    }
    
    public var isSecureTextEntry: Bool {
        get { textField.textField.isSecureTextEntry }
        set { textField.textField.isSecureTextEntry = newValue }
    }
    
    public var title: String {
        didSet { textField.title = title }
    }
    
    public var font: DSFontName {
        didSet { configure() }
    }
    
    public var color: UIColor {
        didSet { configure() }
    }
    
    public var onChange: ((UITextField) -> Void)?
    
    private var listItems: [UISHListItemViewModel]
    
    // MARK: UI Elements
    
    private lazy var button: UIButton = {
        let button = UIButton(
            frame: CGRect(x: -.nano, y: .zero, width: .superBig, height: .xxBig)
        )
        button.setImage(UIImage(systemName: DSConstants.Icons.eyeClosed), for: .normal)
        button.setImage(UIImage(systemName: DSConstants.Icons.eyeOpen), for: .selected)
        button.tintColor = color
        return button
    }()
    
    private lazy var textField: UISHTextField = {
        let field = UISHTextField(
            title: title,
            font: font,
            color: color,
            listItems: listItems
        )
        field.textField.isSecureTextEntry = true
        field.textField.rightView = UIView(
            frame: CGRect(x: -.nano, y: .zero, width: .superBig, height: .xxBig)
        )
        field.textField.rightView?.addSubview(button)
        field.textField.clearsOnBeginEditing = false
        field.textField.clearsOnInsertion = false
        return field
    }()
    
    // MARK: Init
    
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
    
    public func updateListItems(_ items: [UISHListItemViewModel]) {
        listItems = items
        textField.updateListItems(items)
    }
}

private extension UISHPasswordField {
    
    // MARK: Private methods
    
    func setup() {
        configure()
        setupHierarchy()
        setupConstraints()
        setupAction()
    }
    
    func configure() {
        textField.color = color
        textField.font = font
    }
    
    func setupHierarchy() {
        addSubview(textField)
    }
    
    func setupConstraints() {
        textField.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupAction() {
        textField.onChange = onChange
        button.addTarget(self, action: #selector(showHidePassword(_:)), for: .touchUpInside)
    }
    
    @objc
    func showHidePassword(_ sender: UIButton) {
        sender.isSelected.toggle()
        isSecureTextEntry.toggle()
    }
}
