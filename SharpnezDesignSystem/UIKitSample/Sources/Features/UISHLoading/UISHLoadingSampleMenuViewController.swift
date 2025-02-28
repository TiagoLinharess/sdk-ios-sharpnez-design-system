//
//  UISHLoadingSampleMenuViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import SharpnezDesignSystem
import UIKit

class UISHLoadingViewModel: UISHLoadingViewModelProtocol {
    struct Example {}
    typealias T = Example
    
    var sampleTitle: String
    var onFinish: ((Result<Example, any Error>) -> Void)?
    var primaryText: String
    var secondaryText: String?
    var color: UIColor
    var onColor: UIColor
    var font: DSFontName
    
    init(
        sampleTitle: String,
        primaryText: String,
        secondaryText: String? = nil,
        color: UIColor,
        onColor: UIColor,
        font: DSFontName
    ) {
        self.sampleTitle = sampleTitle
        self.primaryText = primaryText
        self.secondaryText = secondaryText
        self.color = color
        self.onColor = onColor
        self.font = font
    }

    func perform() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) {
            self.onFinish?(.success(Example()))
        }
    }
}

final class UISHLoadingSampleMenuViewController: UIViewController {
    
    let viewModels: [UISHLoadingViewModel] = [
        .init(
            sampleTitle: "Primary with secondary text",
            primaryText: "Loading",
            secondaryText: "Finishing",
            color: .primarySH,
            onColor: .onPrimarySH,
            font: .poppins
        ),
        .init(
            sampleTitle: "Secondary",
            primaryText: "Loading",
            color: .secondarySH,
            onColor: .onSecondarySH,
            font: .poppins
        ),
        .init(
            sampleTitle: "Background",
            primaryText: "Loading",
            color: .backgroundSH,
            onColor: .onBackgroundSH,
            font: .poppins
        ),
        .init(
            sampleTitle: "Surface",
            primaryText: "Loading",
            color: .surfaceSH,
            onColor: .onSurfaceSH,
            font: .poppins
        ),
    ]
    
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

extension UISHLoadingSampleMenuViewController: ViewCode {
    
    func setupView() {
        title = "UIKit Sample"
        view.backgroundColor = .backgroundSH
    }

    func setupHierarchy() {
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension UISHLoadingSampleMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModels[indexPath.row]
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = item.sampleTitle
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        item.onFinish = { _ in
            self.navigationController?.popViewController(animated: true)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModels[indexPath.row]
        let controller = UISHLoadingViewController(viewModel: item)
        navigationController?.pushViewController(controller, animated: true)
    }
}
