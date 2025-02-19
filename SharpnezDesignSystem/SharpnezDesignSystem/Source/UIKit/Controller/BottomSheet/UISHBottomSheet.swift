//
//  UISHBottomSheet.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 29/01/25.
//

import UIKit

public struct UISHBottomSheetViewModel {
    
    /// Bottom sheet containter view background color
    public let backgroundColor: UIColor
    
    /// Bottom sheet close button color
    public let tintColor: UIColor
    
    /// Bottom sheet close on tap background view
    public let closeOnTapOutside: Bool
    
    /// Bottom sheet show/hide close button
    public let hasCloseButton: Bool
    
    /// View model init
    public init(
        backgroundColor: UIColor,
        tintColor: UIColor,
        closeOnTapOutside: Bool = true,
        hasCloseButton: Bool = true
    ) {
        self.backgroundColor = backgroundColor
        self.tintColor = tintColor
        self.closeOnTapOutside = closeOnTapOutside
        self.hasCloseButton = hasCloseButton
    }
}

public final class UISHBottomSheet: UIViewController {
    
    // MARK: Properties
    
    /// View Model
    private let viewModel: UISHBottomSheetViewModel
    
    /// Did close action
    public var didCLose: (() -> Void)?
    
    // MARK: UI elements
    
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        return view
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = viewModel.backgroundColor
        view.clipsToBounds = true
        view.layer.cornerRadius = .medium
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        return view
    }()
    
    private lazy var headerView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var closeIcon: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: DSConstants.Icons.close))
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = viewModel.tintColor
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    private let contentView: UIView
    
    // MARK: Init
    
    /// Bottom sheet init
    public init(contentView: UIView, bottomSheetViewModel: UISHBottomSheetViewModel) {
        self.contentView = contentView
        self.viewModel = bottomSheetViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required init?(coder: NSCoder) { nil }
    
    // MARK: View life cycle
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAnimations()
    }
    
    // MARK: Public methods
    
    public func close(completion: @escaping () -> Void) {
        closeBottomSheet(completion: completion)
    }
}

private extension UISHBottomSheet {
    
    // MARK: View Code
    
    func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
        setupActions()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupHierarchy() {
        view.addSubviews(backgroundView, containerView)
        containerView.addSubview(contentView)
        
        if viewModel.hasCloseButton {
            containerView.addSubview(headerView)
            headerView.addSubview(closeIcon)
        }
    }
    
    func setupConstraints() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        contentView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        closeIcon.translatesAutoresizingMaskIntoConstraints = false
        let bottomSafeArea = UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? .zero
        
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            containerView.topAnchor.constraint(
                greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor
            ),
            containerView.heightAnchor.constraint(greaterThanOrEqualToConstant: .superGiant)
        ])
        
        NSLayoutConstraint.activate([
            contentView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            contentView.bottomAnchor.constraint(
                equalTo: containerView.bottomAnchor,
                constant: -bottomSafeArea
            )
        ])
        
        if viewModel.hasCloseButton {
            NSLayoutConstraint.activate([
                headerView.topAnchor.constraint(equalTo: containerView.topAnchor),
                headerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
                headerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor)
            ])
            
            NSLayoutConstraint.activate([
                closeIcon.topAnchor.constraint(equalTo: headerView.topAnchor, constant: .small),
                closeIcon.trailingAnchor.constraint(
                    equalTo: headerView.trailingAnchor,
                    constant: -.small
                ),
                closeIcon.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
                closeIcon.heightAnchor.constraint(equalToConstant: .xBig),
                closeIcon.widthAnchor.constraint(equalToConstant: .xBig),
            ])
            
            contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor).isActive = true
        } else {
            contentView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        }
    }
    
    func setupActions() {
        addBackgroundAction()
        addCloseIconAction()
    }
}

private extension UISHBottomSheet {
    
    // MARK: Private methods
    
    func setupAnimations() {
        UIView.animate(
            withDuration: 0.4,
            delay: 0.4,
            options: .curveEaseInOut
        ) { [weak self] in
            self?.backgroundView.alpha = 0.4
        }
    }
    
    func addBackgroundAction() {
        guard viewModel.closeOnTapOutside else { return }
        let backgroundGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(finish)
        )
        backgroundView.addGestureRecognizer(backgroundGesture)
    }
    
    func addCloseIconAction() {
        guard viewModel.hasCloseButton else { return }
        let iconGesture = UITapGestureRecognizer(
            target: self,
            action: #selector(finish)
        )
        iconGesture.numberOfTapsRequired = 1
        closeIcon.addGestureRecognizer(iconGesture)
    }
    
    @objc
    func finish() {
        closeBottomSheet { [weak self] in
            self?.dismiss(animated: true) { [weak self] in
                self?.didCLose?()
            }
        }
    }
    
    func closeBottomSheet(completion: @escaping () -> Void) {
        UIView.animate(
            withDuration: 0.2,
            delay: .zero,
            options: .curveEaseInOut
        ) { [weak self] in
            self?.backgroundView.alpha = 0
        } completion: { [weak self] _ in
            self?.dismiss(animated: true) { completion() }
        }
    }
}
