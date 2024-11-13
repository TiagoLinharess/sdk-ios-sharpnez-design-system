//
//  ViewStatus.swift
//  SDKCore
//
//  Created by Tiago Linhares on 04/07/23.
//

import Foundation

public enum ViewStatus: Equatable {
    case success, loading, none, error(String)
}
