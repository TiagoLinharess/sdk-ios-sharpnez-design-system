//
//  SampleItem.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

struct SampleItem: Identifiable {
    let id: UUID = .init()
    let controller: UIViewController
    let name: String
    
    static var samples: [SampleItem] = [
        .init(controller: UIViewController(), name: "Custom Fonts"),
        .init(controller: FlavorColorsViewController(), name: "Flavor Colors"),
        .init(controller: UIViewController(), name: "View Status Sample"),
        .init(controller: UIViewController(), name: "UISHButton"),
        .init(controller: UIViewController(), name: "UISHContainer"),
        .init(controller: UIViewController(), name: "UISHFeedbackView"),
        .init(controller: UIViewController(), name: "UISHLabel"),
        .init(controller: UIViewController(), name: "UISHLoading"),
        .init(controller: UIViewController(), name: "UISHLoadingView"),
        .init(controller: UIViewController(), name: "UISHShortcut"),
        .init(controller: UIViewController(), name: "UISHTextField"),
        .init(controller: UIViewController(), name: "UISHPasswordField")
    ]
}
