//
//  SHIconSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHIconSampleView: View {
    var body: some View {
        VStack(alignment: .center) {
            SHIcon(icon: .addProfile)
                .foregroundStyle(Color.primarySH)
            SHIcon(icon: .profile)
                .foregroundStyle(Color.primarySH)
            SHIcon(icon: .bills)
                .foregroundStyle(Color.primarySH)
            SHIcon(icon: .budget)
                .foregroundStyle(Color.primarySH)
            SHIcon(icon: .card)
                .foregroundStyle(Color.primarySH)
            SHIcon(icon: .coin)
                .foregroundStyle(Color.primarySH)
        }
    }
}
