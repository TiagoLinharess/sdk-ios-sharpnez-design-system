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
        .init(controller: UISHFeedbackSampleMenuViewController(), name: "UISHFeedbackViewController"),
        .init(controller: UISHIconViewController(), name: "UISHIconView"),
        .init(controller: UISHBulletIconViewController(), name: "UISHBulletIconView"),
        .init(controller: UISHLabelViewController(), name: "UISHLabel"),
        .init(controller: UISHListItemViewController(), name: "UISHListItem"),
        .init(controller: UISHLoadingSampleViewController(), name: "UISHLoading"),
        .init(controller: UISHLoadingSampleMenuViewController(), name: "UISHLoadingViewController"),
        .init(controller: UISHShortcutButtonViewController(), name: "UISHShortcut"),
        .init(controller: UISHTextFieldViewController(), name: "UISHTextField"),
        .init(controller: UISHPasswordFieldViewController(), name: "UISHPasswordField"),
        .init(controller: UISHToastViewController(), name: "UISHToast"),
        .init(controller: UISHBottomSheetViewController(), name: "UISHBottomSheet")
    ]
}
