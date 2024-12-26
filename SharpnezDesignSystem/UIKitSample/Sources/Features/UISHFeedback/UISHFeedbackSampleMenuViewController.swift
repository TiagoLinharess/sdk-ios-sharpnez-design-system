//
//  UISHFeedbackSampleMenuViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 26/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHFeedbackViewModel: UISHFeedbackViewModelProtocol {
    var type: UISHFeedbackType
    var title: String
    var description: String
    var primaryActionTitle: String
    var secondaryActionTitle: String?
    var primaryAction: () -> Void
    var secondaryAction: (() -> Void)?
    
    init(
        type: UISHFeedbackType,
        title: String,
        description: String,
        primaryActionTitle: String,
        secondaryActionTitle: String? = nil,
        primaryAction: @escaping () -> Void,
        secondaryAction: (() -> Void)? = nil
    ) {
        self.type = type
        self.title = title
        self.description = description
        self.primaryActionTitle = primaryActionTitle
        self.secondaryActionTitle = secondaryActionTitle
        self.primaryAction = primaryAction
        self.secondaryAction = secondaryAction
    }
}

final class UISHFeedbackSampleMenuViewController: UIViewController {
    
    lazy var viewModels: [UISHFeedbackViewModel] = [
        .init(
            type: .success,
            title: "Success",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            primaryActionTitle: "Close",
            primaryAction: action
        ),
        .init(
            type: .warning,
            title: "Warning",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            primaryActionTitle: "Close",
            primaryAction: action
        ),
        .init(
            type: .error,
            title: "Error",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            primaryActionTitle: "Close",
            secondaryActionTitle: "Close",
            primaryAction: action,
            secondaryAction: action
        ),
        .init(
            type: .info,
            title: "Info",
            description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
            primaryActionTitle: "Close",
            primaryAction: action
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
    
    func action() {
        navigationController?.popViewController(animated: true)
    }
}

extension UISHFeedbackSampleMenuViewController: ViewCode {
    
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

extension UISHFeedbackSampleMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = viewModels[indexPath.row]
        let cell = tableView.dequeue(UITableViewCell.self, for: indexPath)
        
        var content = cell.defaultContentConfiguration()
        content.text = item.title
        
        cell.contentConfiguration = content
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModels[indexPath.row]
        let controller = UISHFeedbackViewController(viewModel: item)
        navigationController?.pushViewController(controller, animated: true)
    }
}

