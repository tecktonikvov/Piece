import SnapKit

protocol ChildPageViewControllerInterface: UIViewController {
    var delegate: AddEventStepsControllDelegate? { get set }
}

protocol AddEventStepsControllDelegate: UIViewController {
    func nextButtonDidPressed()
    func previousButtonDidPressd()
}

 final class AddEventPageController: UIViewController {
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.gray_lighter()
        return view
    }()
        
    private let separatorView = UnderlineView(isDark: true)
    
    private let headerInfoView = AddEventHeaderView(state: .addBaseInfo)
    
    private lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        if let controller = childControllers.first {
            pageController.setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        }
        return pageController
    }()

    private lazy var childControllers = viewModel.getControllers()
    private var currentIndex: Int = 0
    private var viewModel: AddEventPageControllerViewModelInterface


    init(viewModel: AddEventPageControllerViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
        self.viewModel.updatePriceBlock = { [weak self] totalPrice in
            self?.headerInfoView.setTotalPrice(totalPrice)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
            navigationController?.setNavigationBarHidden(true, animated: false)
       }

    private func configureView() {
        childControllers.forEach { $0.delegate = self }
        view.backgroundColor = R.color.white()
        configureHeaderContainerView()
        configureHeaderInfoView()
        configureSeparatorView()
        configurePageController()
    }

    private func configureHeaderContainerView() {
        view.addSubview(headerContainerView)
        headerContainerView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    private func configureHeaderInfoView() {
        headerContainerView.addSubview(headerInfoView)
        headerInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(32)
        }
    }
    
    private func configureSeparatorView() {
        view.addSubview(separatorView)
        separatorView.snp.makeConstraints {
            $0.top.equalTo(headerContainerView.snp.bottom)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    private func configurePageController() {
        self.addChild(self.pageController)
        view.addSubview(pageController.view)
        pageController.view.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

 }

extension AddEventPageController: AddEventStepsControllDelegate {
    public func nextButtonDidPressed() {
        let nextIndex = currentIndex + 1
        let nextController = childControllers[nextIndex]
        pageController.setViewControllers([nextController], direction: .forward, animated: true, completion: nil)
        headerInfoView.setNextStep()
        currentIndex += 1
    }
    
    public func previousButtonDidPressd() {
        let previousIndex = currentIndex - 1
        let previousController = childControllers[previousIndex]
        pageController.setViewControllers([previousController], direction: .reverse, animated: true, completion: nil)
        headerInfoView.setPreviousStep()
        currentIndex -= 1
    }
}
