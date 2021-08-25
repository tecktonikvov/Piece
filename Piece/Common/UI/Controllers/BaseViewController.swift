//  Created by Mac on 25.08.2021.
//

import UIKit
import SnapKit

class BaseViewController: UIViewController {
    
    private let headerHeight = 150
    
    private let amountLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = R.color.white()
        label.text = "₴ 12212"
        label.shadow()
        return label
    }()
    
    private let subtitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = R.color.white()
        label.text = "В этом месяце"
        label.shadow()
        return label
    }()
    
    internal let headerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        return view
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
    }
    
    override func viewDidLayoutSubviews() {
        headerView.addGradient()
    }
    
    override func viewDidLoad() {
        configureView()
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
    
}
