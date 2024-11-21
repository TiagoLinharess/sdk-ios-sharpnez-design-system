//
//  SHLoadingSampleView.swift
//  SwiftUISDKSample
//
//  Created by Tiago Linhares on 26/07/23.
//

import SharpnezDesignSystem
import SwiftUI

struct SHLoadingSampleView: View {
    
    var body: some View {
        SHLoading(style: .large, color: .primarySH)
        SHLoading(style: .medium, color: .primarySH)
        SHLoading(style: .small, color: .primarySH)
        SHLoading(style: .nano, color: .primarySH)
    }
}
