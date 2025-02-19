//
//  UISHLoadingViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 25/12/24.
//

import UIKit

public protocol UISHLoadingViewModelProtocol: AnyObject {
    associatedtype T
    
    /// On finish closure
    var onFinish: ((Result<T, Error>) -> Void)? { get }
    
    /// First text
    var primaryText: String { get }
    
    /// Text after 3 seconds
    var secondaryText: String? { get }
    
    /// Background color
    var color: UIColor { get }
    
    /// Loading color
    var onColor: UIColor { get }
    
    /// View font
    var font: DSFontName { get }
    
    /// Loading method
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
    
    /// ViewController init
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
        view.enableConstraints()
        
        let loadingViewConstraints: [NSLayoutConstraint] = [
            loadingView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ]
        
        let primaryLabelConstraints: [NSLayoutConstraint] = [
            primaryLabel.topAnchor.constraint(equalTo: loadingView.bottomAnchor, constant: .small),
            primaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let secondaryLabelConstraints: [NSLayoutConstraint] = [
            secondaryLabel.topAnchor.constraint(
                equalTo: loadingView.bottomAnchor,
                constant: .small
            ),
            secondaryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        NSLayoutConstraint
            .activate(loadingViewConstraints + primaryLabelConstraints + secondaryLabelConstraints)
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
