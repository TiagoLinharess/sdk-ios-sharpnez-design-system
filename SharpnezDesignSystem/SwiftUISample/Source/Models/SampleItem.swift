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
        .init(view: ViewStatusSampleView(), name: "View Status Sample"),
        .init(view: FlavorColorsView(), name: "Flavor Colors"),
        .init(view: FontsView(), name: "Custom Fonts"),
        .init(view: SHLabelSampleView(), name: "SHLabel"),
        .init(view: SHLoadingSampleView(), name: "SHLoading"),
        .init(view: SHLoadingViewSampleView(), name: "SHLoadingView"),
        .init(view: SHButtonSampleView(), name: "SHButton"),
        .init(view: SHShortcutSampleView(), name: "SHShortcut"),
        .init(view: SHContainerSampleView(), name: "SHContainer")
    ]
}
