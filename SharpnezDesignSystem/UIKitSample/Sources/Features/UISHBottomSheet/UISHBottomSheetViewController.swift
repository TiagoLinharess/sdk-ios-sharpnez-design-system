//
//  UISHBottomSheetViewController.swift
//  SharpnezDesignSystem
//
//  Created by Tiago Linhares on 24/12/24.
//

import SharpnezDesignSystem
import SnapKit

final class UISHBottomSheetViewController: UIViewController {
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = .small
        stackView.backgroundColor = .clear
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupComponent()
    }
}

extension UISHBottomSheetViewController: ViewCode {
    
    func setupView() {
        view.backgroundColor = .backgroundSH
        title = "UISHBottomSheet"
    }

    func setupHierarchy() {
        view.addSubviews(stackView)
    }

    func setupConstraints() {
        stackView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.horizontalEdges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension UISHBottomSheetViewController {
    
    private func setupComponent() {
        let components: [UISHButton] = [
            .init(
                style: .ghost(.primarySH),
                title: "Show bottom sheet",
                font: .poppins
            ) {
                self.presentBottomSheet()
            },
            .init(
                style: .ghost(.primarySH),
                title: "Show blocked bottom sheet",
                font: .poppins
            ) {
                self.presentBlockedBottomSheet()
            }
        ]
        
        stackView.addArrangedSubviews(components)
    }
    
    private func presentBottomSheet() {
        let viewModel = UISHBottomSheetViewModel(
            backgroundColor: .primarySH,
            tintColor: .onPrimarySH
        )
        let controller = UISHBottomSheet(
            contentView: BottomSheetExampleView(),
            bottomSheetViewModel: viewModel
        )
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
    
    private func presentBlockedBottomSheet() {
        let viewModel = UISHBottomSheetViewModel(
            backgroundColor: .onBackgroundSH,
            tintColor: .backgroundSH,
            hasCloseButton: false
        )
        let controller = UISHBottomSheet(
            contentView: BottomSheetExampleView(),
            bottomSheetViewModel: viewModel
        )
        controller.modalPresentationStyle = .overFullScreen
        present(controller, animated: true)
    }
}

final class BottomSheetExampleView: UIView {
    
    init() {
        super.init(frame: .zero)
        let label = UISHLabel(
            text: "Lorem ipsum odor amet, consectetuer adipiscing elit. Magna rhoncus mattis imperdiet consectetur montes interdum cubilia per. Himenaeos habitasse sit eleifend condimentum efficitur. Interdum fermentum euismod sem, enim elementum id lobortis. Maximus volutpat mauris nisl lacus accumsan bibendum? Molestie tortor vivamus adipiscing; justo accumsan aptent egestas. Tellus netus massa a maecenas imperdiet placerat penatibus. Cursus proin eleifend ridiculus pharetra tellus viverra fusce sit ad? Pretium suscipit ridiculus, laoreet varius elementum fames quam volutpat mauris.",
            textColor: .onPrimarySH,
            font: .body(.montserrat, .regular)
        )
        addSubview(label)
        label.snp.makeConstraints {
            $0.edges.equalToSuperview().inset(CGFloat.small)
        }
    }

    required init?(coder: NSCoder) { nil }
}
