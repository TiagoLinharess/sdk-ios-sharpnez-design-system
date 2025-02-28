//
//  SHPinCode.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 21/02/25.
//

import SwiftUI

enum PinCodeFocusState {
    case step1
    case step2
    case step3
    case step4
}

public struct SHPinCode: View {
    
    // MARK: Properties
    
    /// On complete action
    private let onFinish: (String) -> Void
    
    /// Text field color
    private let color: Color
    
    @FocusState private var focusState: PinCodeFocusState?
    @State private var step1Text: String = ""
    @State private var step2Text: String = ""
    @State private var step3Text: String = ""
    @State private var step4Text: String = ""
    
    // MARK: Init
    
    public init(color: Color, onFinish: @escaping (String) -> Void) {
        self.onFinish = onFinish
        self.color = color
    }
    
    // MARK: Body
    
    public var body: some View {
        HStack(alignment: .center, spacing: .small) {
            field(text: $step1Text, step: .step1, didChange: didChangeStep1Text)
            field(text: $step2Text, step: .step2, didChange: didChangeStep2Text)
            field(text: $step3Text, step: .step3, didChange: didChangeStep3Text)
            field(text: $step4Text, step: .step4, didChange: didChangeStep4Text)
        }
    }
    
    // MARK: Private methods
    
    @ViewBuilder
    private func field(
        text: Binding<String>,
        step: PinCodeFocusState,
        didChange: @escaping (String) -> Void
    ) -> some View {
        SecureField(String(), text: text)
            .multilineTextAlignment(.center)
            .textInputAutocapitalization(.never)
            .keyboardType(.numberPad)
            .autocorrectionDisabled()
            .focused($focusState, equals: step)
            .onChange(of: text.wrappedValue) { _, newValue in
                didChange(newValue)
            }
            .foregroundStyle(color)
            .padding(.smaller)
            .overlay {
                RoundedRectangle(cornerRadius: .extraSmall)
                    .stroke(color, lineWidth: .two)
            }
            .frame(width: .superBig, height: .superBig)
    }
    
    private func didChangeStep1Text(_ newValue: String) {
        if newValue.count > 1 {
            step1Text.removeFirst()
            focusState = .step2
            return
        }
        
        if newValue.count == 1 {
            focusState = .step2
        }
    }
    
    private func didChangeStep2Text(_ newValue: String) {
        if newValue.count > 1 {
            step2Text.removeFirst()
        }
        
        if newValue.count < 1 {
            focusState = .step1
            return
        }
        
        focusState = .step3
    }
    
    private func didChangeStep3Text(_ newValue: String) {
        if newValue.count > 1 {
            step3Text.removeFirst()
        }
        
        if newValue.count < 1 {
            focusState = .step2
            return
        }
        
        focusState = .step4
    }
    
    private func didChangeStep4Text(_ newValue: String) {
        if newValue.count > 1 {
            step4Text.removeFirst()
        }
        
        if newValue.count < 1 {
            focusState = .step3
            return
        }
        
        focusState = nil
        onFinish(step1Text + step2Text + step3Text + step4Text)
    }
}
