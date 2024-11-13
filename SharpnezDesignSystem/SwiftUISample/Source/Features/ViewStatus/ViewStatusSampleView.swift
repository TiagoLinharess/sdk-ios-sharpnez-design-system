//
//  ViewStatusSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 11/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct ViewStatusSampleView: View {
    
    @State var viewStatus: ViewStatus = .none
    
    var body: some View {
        status
        buttons
    }
    
    @ViewBuilder var status: some View {
        switch viewStatus {
        case .success:
            Text("current status: success")
        case .loading:
            Text("current status: loading")
        case .none:
            Text("current status: none")
        case .error(let error):
            Text("current status: \(error)")
        @unknown default:
            fatalError()
        }
    }
    
    @ViewBuilder var buttons: some View {
        Spacer()
        Button("Change to success") {
            viewStatus = .success
        }
        Spacer()
        Button("Change to error") {
            viewStatus = .error("error message")
        }
        Spacer()
        Button("Change to loading") {
            viewStatus = .loading
        }
        Spacer()
        Button("Change to none") {
            viewStatus = .none
        }
        Spacer()
    }
}
