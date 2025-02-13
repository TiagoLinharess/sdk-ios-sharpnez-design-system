//
//  UISHIcon.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 10/02/25.
//

import UIKit

public enum UISHIcon: String {
    
    // MARK: UISHIcon
    
    case profile
    case addProfile
}

public final class UISHIconView: UIImageView {
    
    // MARK: UISHIconView init
    
    /// Icon init
    public required init(icon: UISHIcon) {
        let bundle = BundleToken.bundle
        let image = UIImage(named: icon.rawValue, in: bundle, with: .none)
        super.init(image: image)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
    
    // MARK: Public methods
    
    /// Change icon method
    func setIcon(_ icon: UISHIcon) {
        let bundle = BundleToken.bundle
        image = UIImage(named: icon.rawValue, in: bundle, with: .none)
    }
}

private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
