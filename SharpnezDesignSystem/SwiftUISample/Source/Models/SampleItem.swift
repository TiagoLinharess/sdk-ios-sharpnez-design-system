//
//  SampleItem.swift
//  SDKCoreSample
//
//  Created by Tiago Linhares on 04/07/23.
//

import SwiftUI

struct SampleItem: Identifiable {
    let id: UUID = .init()
    let view: any View
    let name: String
    
    static var samples: [SampleItem] = [
        .init(view: FontsView(), name: "Custom Fonts"),
        .init(view: FlavorColorsView(), name: "Flavor Colors"),
        .init(view: ViewStatusSampleView(), name: "View Status Sample"),
        .init(view: SHButtonSampleView(), name: "SHButton"),
        .init(view: SHContainerSampleView(), name: "SHContainer"),
        .init(view: SHFeedbackViewSampleView(), name: "SHFeedbackView"),
        .init(view: SHIconSampleView(), name: "SHIcon"),
        .init(view: SHBulletIconSampleView(), name: "SHBulletIcon"),
        .init(view: SHLabelSampleView(), name: "SHLabel"),
        .init(view: SHListItemSampleView(), name: "SHListItem"),
        .init(view: SHLoadingSampleView(), name: "SHLoading"),
        .init(view: SHLoadingViewSampleView(), name: "SHLoadingView"),
        .init(view: SHShortcutSampleView(), name: "SHShortcut"),
        .init(view: SHTextfieldSampleView(), name: "SHTextField"),
        .init(view: SHPasswordFieldSampleView(), name: "SHPasswordField")
    ]
}
