//
//  UIViewController+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public extension UIViewController {
    
    // MARK: Public Methods
    
    /// Set default DS header
    func setDefaultHeader(title: String, backCompletion: (() -> Void)? = nil) {
        defaultHeaderView(title: title)
        defaultNavigationBarAppearance(backCompletion: backCompletion)
        navigationController?.interactivePopGestureRecognizer?.delegate = self
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    /// Remove Back Button
    func removeBackButton() {
        navigationItem.leftBarButtonItem = nil
    }
}

private extension UIViewController {
    
    // MARK: Private Methods
    
    func defaultHeaderView(title: String) {
        let label = UISHLabel(
            text: title,
            textColor: .onBackgroundSH,
            font: .body(.poppins, .medium)
        )
        
        navigationItem.titleView = label
    }
    
    func defaultNavigationBarAppearance(backCompletion: (() -> Void)?) {
        let appearance = UINavigationBarAppearance()
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        appearance.backgroundColor = .clear
        appearance.configureWithTransparentBackground()
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.compactScrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .clear
        
        let frame = CGRect(x: .zero, y: .zero, width: .small, height: .small)
        let action = UIAction { [weak self] _ in
            self?.navigationController?.popViewController(animated: true)
            backCompletion?()
        }
        let navButton = UIButton(frame: frame, primaryAction: action)
        navButton.setBackgroundImage(UIImage(systemName: DSConstants.Icons.arrowLeft), for: .normal)
        navButton.tintColor = .onBackgroundSH
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navButton)
    }
}

extension UIViewController: @retroactive UIGestureRecognizerDelegate {
    
    // MARK: UIGestureRecognizerDelegate
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        guard gestureRecognizer == navigationController?.interactivePopGestureRecognizer
        else { return false }
        return navigationController?.viewControllers.count ?? .zero > 1
    }
}
