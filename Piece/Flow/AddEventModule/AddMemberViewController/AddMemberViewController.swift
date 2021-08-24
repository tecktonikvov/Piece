//  Created by Mac on 18.08.2021.
//

import UIKit
import SnapKit

final class AddMemberViewController: UIViewController, ChildPageViewControllerInterface {
    
    weak var delegate: AddEventStepsControllDelegate?
        
    private lazy var nextButton: PButton = {
        let button = PButton(title: "Далее")
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
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var searchView: UISearchBar = {
        let bar = UISearchBar()
        bar.delegate = self
        bar.backgroundImage = UIImage()
        bar.placeholder = "Поиск"
        bar.setTextColor(R.color.text_base())
        return bar
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private let viewModel: AddMemberViewModelIntarface
    
    init(viewModel: AddMemberViewModelIntarface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureView() {
        view.addGestureRecognizer(UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing(_:))))
        configuteSearchView()
        configureStackview()
        configureTableView()
    }
    
    private func configuteSearchView() {
        view.addSubview(searchView)
        searchView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(12)
            $0.leading.trailing.equalToSuperview().inset(16)
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
            $0.top.equalTo(searchView.snp.bottom).inset(-8)
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

extension AddMemberViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText)
        tableView.reloadData()
    }
}
