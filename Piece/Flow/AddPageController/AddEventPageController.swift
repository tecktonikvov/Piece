import SnapKit

//typealias AddEventPageControllerAdapter = UIPageViewControllerDelegate & UIPageViewControllerDataSource

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
        //pageController.delegate = self
        if let controller = childControllers.first {
            pageController.setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        }
        return pageController
    }()

    private var currentIndex: Int = 0
    private lazy var childControllers = viewModel.getControllers()
    private let viewModel: AddEventPageControllerViewModelInterface


    init(viewModel: AddEventPageControllerViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        configureView()
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

//extension AddEventPageController: AddEventPageControllerAdapter {
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
//        let controllers = childControllers as [UIViewController]
//        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
//        let nextIndex = viewControllerIndex + 1
//        guard childControllers.count != nextIndex else { return nil }
//        guard childControllers.count > nextIndex else { return nil }
//        return controllers[nextIndex]
//    }
//
//    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
//        let controllers = childControllers as [UIViewController]
//        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
//        let previousIndex = viewControllerIndex - 1
//        guard previousIndex >= 0 else { return nil }
//        guard childControllers.count > previousIndex else { return nil }
//        return controllers[previousIndex]
//    }

//    func pageViewController(_: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
//        guard let destinationViewController = pendingViewControllers.first else { return }
//        let controllers = childControllers as [UIViewController]
//        guard let viewControllerIndex = controllers.firstIndex(of: destinationViewController) else { return }
//        currentIndex = viewControllerIndex
//    }
//}

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
