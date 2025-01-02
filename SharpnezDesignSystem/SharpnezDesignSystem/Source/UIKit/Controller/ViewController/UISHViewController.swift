//
//  UISHViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

open class UISHViewController<View: UIView, ViewModel: AnyObject>: UIViewController {
    
    // MARK: Properties
    
    public let viewModel: ViewModel
    public let customView: View
    
    // MARK: Init
    
    public init(customView: View, viewModel: ViewModel) {
        self.customView = customView
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required public init?(coder: NSCoder) { nil }
    
    // MARK: View Life Cicle
    
    open override func loadView() {
        view = customView
    }
}
