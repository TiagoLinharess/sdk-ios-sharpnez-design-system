//
//  SHToastSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 20/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHToastSampleView: View {
    @State private var toast: SHToastViewModel? = nil
    
    var body: some View {
        VStack(spacing: 32) {
            Button {
                toast = SHToastViewModel(
                    style: .success,
                    font: .montserrat,
                    message: "Saved."
                )
            } label: {
                Text("Run (Success)")
            }
            
            Button {
                toast = SHToastViewModel(
                    style: .info,
                    font: .montserrat,
                    message: "Btw, you are a good person."
                )
            } label: {
                Text("Run (Info)")
            }
            
            Button {
                toast = SHToastViewModel(
                    style: .warning,
                    font: .montserrat,
                    message: "Beware of a dog!"
                )
            } label: {
                Text("Run (Warning)")
            }
            
            Button {
                toast = SHToastViewModel(
                    style: .error,
                    font: .montserrat,
                    message: "Fatal error, blue screen level. Fatal error, blue screen level. Fatal error, blue screen level. Fatal error, blue screen level."
                )
            } label: {
                Text("Run (Error)")
            }
            
        }
        .toastView(toast: $toast)
    }
}
