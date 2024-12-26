//
//  UISHLoadingViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 25/12/24.
//

import SnapKit

public protocol UISHLoadingViewModelProtocol: AnyObject {
    associatedtype T
    
    var onFinish: ((Result<T, Error>) -> Void)? { get }
    var primaryText: String { get }
    var secondaryText: String? { get }
    var color: UIColor { get }
    var onColor: UIColor { get }
    var font: DSFontName { get }
    
    func perform()
}

public final class UISHLoadingViewController<ViewModel: UISHLoadingViewModelProtocol>: UIViewController {
    
    // MARK: Properties
    
    private let viewModel: ViewModel
    
    // MARK: UI Elements
    
    private lazy var loadingView: UISHLoadingView = {
        return UISHLoadingView(color: viewModel.onColor, style: .large)
    }()
    
    private lazy var primaryLabel: UILabel = {
        return UISHLabel(
            text: viewModel.primaryText,
            textColor: viewModel.onColor,
            font: .subtitle(viewModel.font, .bold)
        )
    }()
    
    private lazy var secondaryLabel: UILabel = {
        return UISHLabel(
            text: viewModel.secondaryText ?? String(),
            textColor: viewModel.onColor,
            font: .subtitle(viewModel.font, .bold)
        )
    }()
    
    // MARK: Init
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
    
    // MARK: View Life Cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.perform()
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

private extension UISHLoadingViewController {
    
    // MARK: View Code
    
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
        setupAnimations()
    }
    
    func setupView() {
        view.backgroundColor = viewModel.color
        secondaryLabel.isHidden = true
    }
    
    func setupHierarchy() {
        view.addSubviews(loadingView, primaryLabel, secondaryLabel)
    }
    
    func setupConstraints() {
        loadingView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        [primaryLabel, secondaryLabel].forEach { label in
            label.snp.makeConstraints {
                $0.top.equalTo(loadingView.snp.bottom).offset(CGFloat.small)
                $0.centerX.equalToSuperview().inset(CGFloat.small)
            }
        }
    }
    
    func setupAnimations() {
        Task {
            if viewModel.secondaryText != nil {
                try? await Task.sleep(for: Duration.seconds(3))
                primaryLabel.isHidden = true
                secondaryLabel.isHidden = false
            }
        }
    }
}
