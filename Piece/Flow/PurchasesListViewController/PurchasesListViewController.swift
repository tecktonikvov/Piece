//  Created by Mac on 30.08.2021.
//

import UIKit

final class PurchasesListViewController: BaseViewController {
    
    private lazy var addNavButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = R.image.add_nav_icon()
        button.tintColor = R.color.white()
        button.action = #selector(addButtonDidPressed)
        button.target = self
        return button
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let viewModel: PurchasesListViewModelInterface
    
    init(viewModel: PurchasesListViewModelInterface) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
        configureView()
        setupCalbacks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = addNavButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.leftBarButtonItem = nil
        navigationItem.rightBarButtonItem = nil
    }
    
    private func configureView() {
        configureTableView()
    }
    
    private func configureTableView() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).inset(8)
            $0.leading.trailing.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    private func setupCalbacks() {
        viewModel.pushDetailBlock = { [weak self] event in
            let detailsViewModel = EventDetailViewModel(event: event)
            let detailsController = EventDetailViewController(viewModel: detailsViewModel)
            self?.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
    
    @objc private func settingsButtonDidPressed() {
        
    }
    
    @objc private func addButtonDidPressed() {
        
    }
}
