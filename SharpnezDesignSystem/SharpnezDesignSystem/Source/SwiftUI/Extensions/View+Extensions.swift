//
//  View+Extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 20/02/25.
//

import SwiftUI

public extension View {
    func closeKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
