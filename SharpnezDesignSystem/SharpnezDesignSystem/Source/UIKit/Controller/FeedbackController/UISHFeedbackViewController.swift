//
//  UISHFeedbackViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import SnapKit

public enum UISHFeedbackType {
    case success
    case warning
    case error
    case info
    
    /// Icon
    var icon: UIImage? {
        switch self {
        case .success:
            UIImage(systemName: DSConstants.Icons.checkmarkCircleFill)
        case .warning:
            UIImage(systemName: DSConstants.Icons.exclamationmarkTriangleFill)
        case .error:
            UIImage(systemName: DSConstants.Icons.exclamationmarkOctagonFill)
        case .info:
            UIImage(systemName: DSConstants.Icons.infoCircleFill)
        }
    }
    
    /// Color
    var color: UIColor {
        switch self {
        case .success: .successSH
        case .warning: .warningSH
        case .error: .errorSH
        case .info: .primarySH
        }
    }
}

public protocol UISHFeedbackViewModelProtocol {
    
    /// Feedback type
    var type: UISHFeedbackType { get }
    
    /// Feedback title
    var title: String { get }
    
    /// Feedback description
    var description: String { get }
    
    /// Feedback primary button title
    var primaryActionTitle: String { get }
    
    /// Feedback secondary button title
    /// if is nil will hide button
    var secondaryActionTitle: String? { get }
    
    /// Feedback primary action
    var primaryAction: () -> Void { get }
    
    /// Feedback secondary action
    var secondaryAction: (() -> Void)? { get }
}

public final class UISHFeedbackViewController<ViewModel: UISHFeedbackViewModelProtocol>:
    UIViewController {
    
    // MARK: Properties
    
    private let viewModel: ViewModel
    
    // MARK: UI Elements
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = viewModel.type.icon
        imageView.tintColor = viewModel.type.color
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var titleLabel: UISHLabel = {
        let label =  UISHLabel(
            text: viewModel.title,
            textColor: .onBackgroundSH,
            font: .title2(.poppins, .medium)
        )
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descriptionLabel: UISHLabel = {
        let label = UISHLabel(
            text: viewModel.description,
            textColor: .onBackgroundSH,
            font: .subtitle(.montserrat, .regular)
        )
        label.textAlignment = .center
        return label
    }()
    
    private lazy var footerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = .small
        stackView.distribution = .fill
        return stackView
    }()
    
    private lazy var primaryButton: UISHButton = {
        return UISHButton(
            style: .primary(.primarySH, .onPrimarySH),
            title: viewModel.primaryActionTitle,
            font: .montserrat,
            action: viewModel.primaryAction
        )
    }()
    
    private lazy var secondaryButton: UISHButton = {
        return UISHButton(
            style: .secondary(.primarySH),
            title: viewModel.secondaryActionTitle ?? String(),
            font: .montserrat,
            action: viewModel.secondaryAction
        )
    }()
    
    // MARK: Init
    
    /// ViewController init
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    public override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
}

private extension UISHFeedbackViewController {
    
    // MARK: View Code
    
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        secondaryButton.isHidden = viewModel.secondaryActionTitle == nil
    }
    
    func setupHierarchy() {
        view.addSubviews(iconView, titleLabel, descriptionLabel, footerStackView)
        footerStackView.addArrangedSubviews(primaryButton, secondaryButton)
    }
    
    func setupConstraints() {
        iconView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.superGiant)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(CGFloat.giant)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(iconView.snp.bottom).offset(CGFloat.small)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
        }
        
        descriptionLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(CGFloat.small)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
        }
        
        footerStackView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(descriptionLabel.snp.bottom).offset(CGFloat.small)
            $0.leading.bottom.trailing.equalTo(view.safeAreaLayoutGuide).inset(CGFloat.small)
        }
    }
}
