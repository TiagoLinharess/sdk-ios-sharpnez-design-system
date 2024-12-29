//
//  PrivateTextField.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 28/12/24.
//

import UIKit

public final class PrivateTextField: UITextField {
    
    // MARK: Properties

    public override var isSecureTextEntry: Bool {
        didSet {
            if isFirstResponder {
                _ = becomeFirstResponder()
            }
        }
    }
    
    // MARK: Public methods

    public override func becomeFirstResponder() -> Bool {
        let success = super.becomeFirstResponder()
        if isSecureTextEntry, let text = self.text {
            deleteBackward()
            insertText(text)
        }
        return success
    }

}
