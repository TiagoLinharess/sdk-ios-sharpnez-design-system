//
//  SHBulletIconSampleView.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 19/02/25.
//

import SharpnezDesignSystem
import SwiftUI

struct SHBulletIconSampleView: View {
    var body: some View {
        VStack(alignment: .center) {
            SHBulletIcon(icon: .addProfile, color: .backgroundSH, backgroundColor: .onBackgroundSH)
            SHBulletIcon(icon: .profile, color: .backgroundSH, backgroundColor: .onBackgroundSH)
            SHBulletIcon(icon: .bills, color: .backgroundSH, backgroundColor: .onBackgroundSH)
            SHBulletIcon(icon: .budget, color: .backgroundSH, backgroundColor: .onBackgroundSH)
            SHBulletIcon(icon: .card, color: .backgroundSH, backgroundColor: .onBackgroundSH)
            SHBulletIcon(icon: .coin, color: .backgroundSH, backgroundColor: .onBackgroundSH)
        }
    }
}
