//
//  SHPinCodeSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHPinCodeSampleView: View {
    var body: some View {
        SHPinCode(color: .primarySH) { value in
            print(value)
        }
    }
}
