//
//  ViewController.swift
//  UIKitSample
//
//  Created by Tiago Linhares on 23/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .insetGrouped)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self)
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) { nil }
}

extension ViewController: ViewCode {
    
    func setupView() {
        title = "UIKit Sample"
        view.backgroundColor = .backgroundSH
    }

    func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return SampleItem.samples.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = SampleItem.samples[indexPath.row]
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = item.name
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = SampleItem.samples[indexPath.row]
        navigationController?.pushViewController(item.controller, animated: true)
    }
}
