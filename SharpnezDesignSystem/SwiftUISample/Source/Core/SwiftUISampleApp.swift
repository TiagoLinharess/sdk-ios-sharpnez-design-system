//
//  SwiftUISampleApp.swift
//  SwiftUISample
//
//  Created by Tiago Linhares on 13/11/24.
//

import SwiftUI

@main
struct SwiftUISampleApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            HomeView()
        }
    }
}
