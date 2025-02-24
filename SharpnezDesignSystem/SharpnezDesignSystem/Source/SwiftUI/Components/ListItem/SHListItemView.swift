//
//  ItemsRulesListView.swift
//  Login
//
//  Created by Tiago Linhares on 23/12/24.
//

import SwiftUI

public struct SHListItemViewModel: Identifiable {
    public let id: String
    public let title: String
    public var isComplete: Bool? = nil
    
    public init(id: String = UUID().uuidString, title: String, isComplete: Bool? = nil) {
        self.id = id
        self.title = title
        self.isComplete = isComplete
    }
}

public struct SHListItemView: View {
    // MARK: Properties
    
    private let items: [SHListItemViewModel]
    private let font: Font
    private let defaultColor: Color
    
    // MARK: Init
    
    public init(items: [SHListItemViewModel], font: Font, defaultColor: Color) {
        self.items = items
        self.font = font
        self.defaultColor = defaultColor
    }
    
    // MARK: Body
    
    public var body: some View {
        ForEach(items) { item in
            HStack {
                Text(DSConstants.Commons.dot + DSConstants.Commons.space + item.title)
                    .configureWithSH(
                        color: isCompleteColor(isComplete: item.isComplete),
                        font: font
                    )
                Spacer()
            }
        }
    }
    
    // MARK: Private Methods
    
    private func isCompleteColor(isComplete: Bool?) -> Color {
        guard let isComplete else { return defaultColor }
        return isComplete ? .success() : .error()
    }
}
