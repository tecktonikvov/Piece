//  Created by Mac on 24.08.2021.
//

import UIKit

final class EventDetailViewController: BaseViewController {
    
    private lazy var editIcon: UIBarButtonItem = {
        let button = UIBarButtonItem()
        button.image = R.image.edit_nav_icon()
        button.tintColor = R.color.white()
        button.action = #selector(editButtonDidPressed)
        button.target = self
        return button
    }()
    
    private let viewModel: EventDetailViewModelIntarface
    
    init(viewModel: EventDetailViewModelIntarface) {
        self.viewModel = viewModel
        super.init(viewModel: viewModel)
        configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = editIcon
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.rightBarButtonItem = nil
    }
        
    private func configureView() {
        //configureTableView()
    }
    
    private func configureTableView() {
        
    }
    
    @objc private func editButtonDidPressed() {
        print("edit")
    }
}
