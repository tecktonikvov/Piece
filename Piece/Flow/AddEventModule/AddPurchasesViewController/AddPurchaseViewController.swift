//  Created by Mac on 16.08.2021.
//

import UIKit
import SnapKit

final class AddPurchaseViewController: UIViewController, ChildPageViewControllerInterface {
    
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
        stackView.distribution = .fillEqually
        stackView.spacing = 16
        return stackView
    }()
    
    private lazy var titlesContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.gray_lighter()
        view.layer.cornerRadius = 4
        return view
    }()
        
    private let itemLabel = PTitleLabel(textColor: R.color.gray_darkest(), fontSize: 16, text: "Название")
    private let priceLabel = PTitleLabel(textColor: R.color.gray_darkest(), fontSize: 16, text: "Цена")

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.delegate = viewModel
        tableView.dataSource = viewModel
        tableView.separatorStyle = .none
        return tableView
    }()
    
    private var viewModel: AddPurchaseViewModelIntarface
    
    init(viewModel: AddPurchaseViewModelIntarface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
        configureCallbacks()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureCallbacks() {
        viewModel.addPurchaseBlock = { [weak self] in
            self?.showAlert()
        }
        
        viewModel.updateBlock = { [weak self] in
            guard let self = self else { return }
            UIView.transition(with: self.tableView, duration: 0.2,
                              options: .transitionCrossDissolve,
                              animations: {self.tableView.reloadData()}, completion: nil)
        }
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
            $0.leading.trailing.equalToSuperview().inset(24)
        }
    }
    
    private func configureItemLabel() {
        titlesContainerView.addSubview(itemLabel)
        itemLabel.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
        }
    }
    
    private func configurePriceLabel() {
        titlesContainerView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints {
            $0.trailing.equalToSuperview().inset(16)
            $0.centerY.equalToSuperview()
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
            $0.top.equalTo(titlesContainerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(stackView.snp.top)
        }
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "Новая покупка", message: "Заполните информацию", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        let doneAction = UIAlertAction(title: "Готово", style: .default) { [weak self] (action) -> Void in
            guard let title = alert.textFields?[0].text, let price = alert.textFields?[1].text else { return }
            self?.doneButtonDidPressed(title: title, price: price)
        }
        doneAction.isEnabled = false

        alert.addTextField { titleTextField in
            titleTextField.placeholder = "Название"
        }
        
        alert.addTextField { priceTextField in
            priceTextField.placeholder = "Цена"
            priceTextField.keyboardType = .decimalPad
        }

        alert.addAction(doneAction)
        alert.addAction(cancelAction)
        
        setObservers(alert: alert, doneAction: doneAction)
       
        self.present(alert, animated: true, completion: nil)
    }
    
    private func setObservers(alert: UIAlertController, doneAction: UIAlertAction) {
        setObserver(alert: alert, doneAction: doneAction, textFieldNumber: 0)
        setObserver(alert: alert, doneAction: doneAction, textFieldNumber: 1)
    }
    
    private func setObserver(alert: UIAlertController, doneAction: UIAlertAction, textFieldNumber: Int) {
        NotificationCenter.default.addObserver(forName: UITextField.textDidChangeNotification,
                                               object: alert.textFields?[textFieldNumber],
                                               queue: OperationQueue.main) { [weak self] _ in
            guard let self = self else { return }
            let title = alert.textFields?[0].text
            let price = alert.textFields?[1].text
            let isUserInputValid = self.viewModel.validateUserInput(title: title, price: price)
            
            doneAction.isEnabled = isUserInputValid
        }
    }
    
    private func doneButtonDidPressed(title: String, price: String) {
        viewModel.createNewPurchase(title: title, price: price)
    }
    
    @objc private func nexButtonDidPressed() {
        delegate?.nextButtonDidPressed()
    }
    
    @objc private func previousButtonDidPressed() {
        delegate?.previousButtonDidPressd()
    }
}
