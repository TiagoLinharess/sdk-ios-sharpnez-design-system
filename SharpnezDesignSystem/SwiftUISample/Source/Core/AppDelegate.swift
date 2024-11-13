//
//  AppDelegate.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 13/11/24.
//

import SharpnezDesignSystem
import SwiftUI

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [
            UIApplication.LaunchOptionsKey: Any
        ]? = nil
    ) -> Bool {
        DesignSystemConfiguration.start(flavorColors: FlavorColors())
        return true
    }
}
