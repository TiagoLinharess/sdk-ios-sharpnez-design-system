//
//  UISHToast.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/01/25.
//

import UIKit

public enum UISHToastType {
    case info
    case success
    case warning
    case error
    
    /// Background color
    @MainActor
    var backgroundColor: UIColor {
        return switch self {
        case .info:
            .primarySH
        case .success:
            .successSH
        case .warning:
            .warningSH
        case .error:
            .errorSH
        }
    }
    
    /// Color
    @MainActor
    var color: UIColor {
        return switch self {
        case .info:
            .onPrimarySH
        case .success:
            .onSuccessSH
        case .warning:
            .onWarningSH
        case .error:
            .onErrorSH
        }
    }
    
    /// Icon
    var icon: UIImage? {
        return switch self {
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
}

public final class UISHToast: UIView {
    
    // MARK: Properties
    
    /// Toast bottom constraint
    public var bottomConstraint: NSLayoutConstraint?
    
    /// Toast type
    private let type: UISHToastType
    
    /// Toast text
    private let text: String
    
    /// Toast font
    private let font: DSFontName
    
    // MARK: UI elements
    
    private lazy var label: UISHLabel = {
        let label = UISHLabel(text: text, textColor: type.color, font: .body(font, .medium))
        label.numberOfLines = 1
        label.textAlignment = .center
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var iconView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = type.icon
        imageView.tintColor = type.color
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    // MARK: Init
    
    init(type: UISHToastType, text: String, font: DSFontName) {
        self.type = type
        self.text = text
        self.font = font
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) { nil }
    
    // MARK: View Code
    
    private func setup() {
        setupView()
        setupHierarchy()
        setupConstraints()
    }
    
    private func setupView() {
        backgroundColor = type.backgroundColor
        layer.cornerRadius = .xBig
        clipsToBounds = true
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupHierarchy() {
        addSubviews(label, iconView)
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor, constant: .small),
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: .small),
            label.trailingAnchor.constraint(equalTo: iconView.leadingAnchor, constant: -.extraSmall),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small),
            
            iconView.widthAnchor.constraint(equalToConstant: .big),
            iconView.heightAnchor.constraint(equalToConstant: .big),
            iconView.topAnchor.constraint(equalTo: topAnchor, constant: .small),
            iconView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -.small),
            iconView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -.small),
        ])
    }
}

public extension UIViewController {
    
    // MARK: ViewController extension
    
    /// Controller toast extension method
    func showToast(type: UISHToastType, text: String, font: DSFontName) {
        removeCurrentToastIfNeeded()
        let toastView = UISHToast(type: type, text: text, font: font)
        startToast(at: toastView)
    }
}

private extension UIViewController {
    
    // MARK: Remove current toast
    
    func removeCurrentToastIfNeeded() {
        view.subviews
            .filter { $0 is UISHToast }
            .forEach {
                if let toast = $0 as? UISHToast {
                    animateHideToast(at: toast)
                }
            }
    }
    
    // MARK: Show / Hide toast
    
    func startToast(at toast: UISHToast) {
        view.addSubview(toast)
        
        let toastBottomAnchor = toast.bottomAnchor
            .constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: .superGiant)
        
        NSLayoutConstraint.activate([
            toastBottomAnchor,
            toast.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: .xxBig),
            toast.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -.xxBig),
        ])
        
        view.layoutIfNeeded()
        toast.bottomConstraint = toastBottomAnchor
        animateShowToast(at: toast)
    }
    
    func hideToast(at toast: UISHToast) {
        Task {
            try? await Task.sleep(for: .seconds(3))
            animateHideToast(at: toast)
        }
    }
    
    // MARK: Animate toast
    
    func animateShowToast(at toast: UISHToast) {
        toast.alpha = .zero
        toast.bottomConstraint?.constant = -.small
        
        UIView.animate(
            withDuration: 0.5,
            delay: .zero,
            options: .curveEaseInOut
        ) { [weak self] in
            toast.alpha = .one
            self?.view.layoutIfNeeded()
        } completion: { [weak self] _ in
            self?.hideToast(at: toast)
        }
    }
    
    func animateHideToast(at toast: UISHToast) {
        toast.bottomConstraint?.constant = .xxBig
        
        UIView.animate(
            withDuration: 0.5,
            delay: .zero,
            options: .curveEaseInOut
        ) { [weak self] in
            toast.alpha = .zero
            self?.view.layoutIfNeeded()
        } completion: { _ in
            toast.removeFromSuperview()
        }
    }
}
