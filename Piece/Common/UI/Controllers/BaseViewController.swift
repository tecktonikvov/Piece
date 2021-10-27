//  Created by Mac on 25.08.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    private let headerHeight = 150
    
    private lazy var backButton: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = R.image.back_nav_icon()
        button.tintColor = R.color.white()
        button.action = #selector(backButtonDidPressed)
        button.target = self
        return button
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = R.color.white()
        let amount = viewModel?.getHeaderAmount() ?? 0.0
        label.text = "₴ " + "\(amount)"
        label.setShadow()
        return label
    }()
    
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = R.color.white()
        label.text = viewModel?.getHeaderSubtitle()
        label.setShadow()
        return label
    }()
    
    internal let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    private var viewModel: BaseViewModelInterface?
    
    init(viewModel: BaseViewModelInterface?) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = true
        navigationItem.leftBarButtonItem = backButton
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.barStyle = .default
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationItem.leftBarButtonItem = nil
    }
    
    override func viewDidLayoutSubviews() {
        headerView.addGradient()
    }
    
    private func configureView() {
        view.backgroundColor = R.color.white()
        configureHeaderView()
        configureAmountLabel()
        configureSubtitleLabel()
    }
    
    private func configureHeaderView() {
        view.addSubview(headerView)
        headerView.snp.makeConstraints {
            $0.height.equalTo(headerHeight)
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func configureAmountLabel() {
        headerView.addSubview(amountLabel)
        amountLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(80)
            $0.centerX.equalToSuperview()
        }
    }
    
    private func configureSubtitleLabel() {
        headerView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(amountLabel.snp.bottom).inset(-4)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc private func backButtonDidPressed() {
        navigationController?.popViewController(animated: true)
    }
    
}
