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
        .init(controller: FontsViewController(), name: "Custom Fonts"),
        .init(controller: FlavorColorsViewController(), name: "Flavor Colors"),
        .init(controller: UISHButtonViewController(), name: "UISHButton"),
        .init(controller: UISHSampleViewController(viewModel: ViewModel()), name: "UISHViewController"),
        .init(controller: UISHFeedbackSampleMenuViewController(), name: "UISHFeedbackViewController"),
        .init(controller: UISHLabelViewController(), name: "UISHLabel"),
        .init(controller: UISHLoadingSampleViewController(), name: "UISHLoading"),
        .init(controller: UISHLoadingSampleMenuViewController(), name: "UISHLoadingViewController"),
        .init(controller: UISHShortcutButtonViewController(), name: "UISHShortcut"),
        .init(controller: UIViewController(), name: "UISHTextField"),
        .init(controller: UIViewController(), name: "UISHPasswordField")
    ]
}
