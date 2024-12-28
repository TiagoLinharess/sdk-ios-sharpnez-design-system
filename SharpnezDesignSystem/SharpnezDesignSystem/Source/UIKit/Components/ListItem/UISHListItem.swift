//
//  UISHListItem.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 27/12/24.
//

import SnapKit

public struct UISHListItemViewModel {
    public let title: String
    public var isComplete: Bool? = nil
    
    public init(title: String, isComplete: Bool? = nil) {
        self.title = DSConstants.Commons.dot + DSConstants.Commons.space + title
        self.isComplete = isComplete
    }
}

public final class UISHListItem: UIView {
    
    // MARK: Properties
    
    public var items: [UISHListItemViewModel] {
        didSet { configure() }
    }
    
    
    public var font: DSFontName {
        didSet { configure() }
    }
    
    
    public var defaultColor: UIColor {
        didSet { configure() }
    }
    
    // MARK: UI Elements
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .extraSmall
        return stackView
    }()
    
    // MARK: Init
    
    public init(
        items: [UISHListItemViewModel],
        font: DSFontName,
        defaultColor: UIColor
    ) {
        self.items = items
        self.font = font
        self.defaultColor = defaultColor
        super.init(frame: .zero)
        setup()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

private extension UISHListItem {
    
    // MARK: Private methods
    
    func setup() {
        configure()
        setupHierarchy()
        setupConstraints()
    }
    
    func configure() {
        stackView.removeFullyAllArrangedSubviews()
        
        items.forEach { viewModel in
            let color: UIColor = {
                if let isComplete = viewModel.isComplete {
                    return isComplete ? .successSH : .errorSH
                }
                
                return defaultColor
            }()
            let label = UISHLabel(
                text: viewModel.title,
                textColor: color,
                font: .caption(font, .regular)
            )
            
            stackView.addArrangedSubview(label)
        }
    }
    
    func setupHierarchy() {
        addSubview(stackView)
    }
    
    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
