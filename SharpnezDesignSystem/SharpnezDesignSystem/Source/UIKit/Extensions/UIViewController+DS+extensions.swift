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
    func setDefaultHeader(title: String) {
        defaultHeaderView(title: title)
        defaultNavigationBarAppearance()
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
    
    func defaultNavigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .backgroundSH
        appearance.shadowImage = UIImage()
        appearance.shadowColor = .clear
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .backgroundSH
        
        let navButton = UIBarButtonItem(
            image: UIImage(systemName: DSConstants.Icons.chevronLeft),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        navButton.tintColor = .onBackgroundSH
        
        navigationItem.leftBarButtonItem = navButton
    }
    
    @objc
    func backAction() {
        navigationController?.popViewController(animated: true)
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
