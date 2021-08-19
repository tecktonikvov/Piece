//  Created by Mac on 16.08.2021.
//

import UIKit
import SnapKit

final class AddPurchachesViewController: UIViewController, ChildPageViewControllerInterface {
    
    weak var delegate: AddEventStepsControllDelegate?
        
    private lazy var nextButton: PButton = {
        let button = PButton(title: "Создать")
        button.addTarget(self, action: #selector(nexButtonDidPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var previousButton: PButtonFramed = {
        let button = PButtonFramed(title: "Назад")
        button.setBackgroundColor(.clear)
        button.addTarget(self, action: #selector(previousButtonDidPressed), for: .touchUpInside)
        return button
    }()
        
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.addArrangedSubview(previousButton)
        stackView.addArrangedSubview(nextButton)
        stackView.distribution = .fillProportionally
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var titlesContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.gray_lighter()
        view.layer.cornerRadius = 4
        return view
    }()
    
    private let itemLabel = PTitleLabel(textColot: R.color.gray_darkest(), fontSize: 16, text: "Название")
    private let priceLabel = PTitleLabel(textColot: R.color.gray_darkest(), fontSize: 16, text: "Цена")

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.separatorStyle = .none
        tableView.register(MemberFullCell.self)
        return tableView
    }()
    
    private let viewModel: AddPurchachesViewModelIntarface
    
    init(viewModel: AddPurchachesViewModelIntarface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        configuteTitlesContainerView()
        configureItemLabel()
        configurePriceLabel()
        configureStackview()
        configureTableView()
    }
    
    private func configuteTitlesContainerView() {
        view.addSubview(titlesContainerView)
        titlesContainerView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(24)
            $0.height.equalTo(32)
            $0.leading.trailing.equalToSuperview().inset(16)
        }
    }
    
    private func configureItemLabel() {
        titlesContainerView.addSubview(itemLabel)
        itemLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
        }
    }
    
    private func configurePriceLabel() {
        titlesContainerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.top.equalToSuperview().inset(8)
        }
    }
    
    private func configureStackview() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints {
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(8)
            $0.leading.trailing.equalToSuperview().inset(32)
            $0.height.equalTo(44)
        }
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(titlesContainerView.snp.bottom).inset(-8)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top)
        }
    }
    
    @objc private func nexButtonDidPressed() {
        delegate?.nextButtonDidPressed()
    }
    
    @objc private func previousButtonDidPressed() {
        delegate?.previousButtonDidPressd()
    }
}
