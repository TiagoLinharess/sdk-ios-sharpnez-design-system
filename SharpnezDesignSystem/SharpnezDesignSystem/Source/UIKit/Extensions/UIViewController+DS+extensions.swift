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
        let navButton = UIButton(frame: frame)
        navButton.setBackgroundImage(UIImage(systemName: DSConstants.Icons.arrowLeft), for: .normal)
        navButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        navButton.tintColor = .onBackgroundSH
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: navButton)
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
