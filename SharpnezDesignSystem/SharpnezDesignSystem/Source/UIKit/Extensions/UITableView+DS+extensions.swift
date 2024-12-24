//
//  UITableView+DS+extensions.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import UIKit

public extension UITableView {
    
    /// Register cell method
    func register<T: UITableViewCell>(_ cell: T.Type) {
        register(cell, forCellReuseIdentifier: cell.identifier)
    }
    
    /// Dequeue cell method
    func dequeue<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        dequeueReusableCell(withIdentifier: cell.identifier, for: indexPath) as? T ?? .init()
    }
    
    /// Cell or dequeue method
    func cellOrDequeue<T: UITableViewCell>(_ cell: T.Type, for indexPath: IndexPath) -> T {
        cellForRow(at: indexPath) as? T ?? dequeue(cell, for: indexPath)
    }
}
