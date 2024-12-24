//
//  UIViewController+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public extension UIViewController {
    
    // MARK: Public Methods
    
    /// Set DS Header
    func setHeader(title: String) {
        headerView(title: title)
        navigationBarAppearance()
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
    
    func headerView(title: String) {
        let label = UISHLabel(
            text: title,
            textColor: .onPrimarySH,
            font: .title3(.poppins, .regular)
        )
        
        navigationItem.titleView = label
    }
    
    func navigationBarAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .primarySH
        
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        navigationController?.navigationBar.tintColor = .primarySH
        
        let navButton = UIBarButtonItem(
            image: UIImage(systemName: DSConstants.Icons.chevronLeft),
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        navButton.tintColor = .onPrimarySH
        
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
