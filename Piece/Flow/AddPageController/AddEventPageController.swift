import SnapKit

typealias AddEventPageControllerAdapter = UIPageViewControllerDelegate & UIPageViewControllerDataSource

protocol ChildPageViewControllerInterface: UIViewController {
    var delegate: AddEventActionsDelegate? { get set }
}

protocol AddEventActionsDelegate: UIViewController {
    func nextButtonDidPressed()
    func previousButtonDidPressd()
}

 final class AddEventPageController: UIViewController {
    
    private let headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.gray_lighter()
        return view
    }()
    
    private let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.color.gray_base()
        return view
    }()
    
    private let headerInfoView = AddEventHeaderView(state: .addBaseInfo)
    
    private lazy var pageController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.delegate = self
        if let controller = pageControllers.first {
            pageController.setViewControllers([controller], direction: .forward, animated: true, completion: nil)
        }
        return pageController
    }()

    private var currentIndex: Int = 0

    private var viewModel: AddEventPageControllerViewModelInterface

    private lazy var pageControllers = viewModel.getControllers()

    init(viewModel: AddEventPageControllerViewModelInterface) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.tabBarController?.tabBar.isHidden = false
        configureView()
    }

    private func configureView() {
        self.addChild(self.pageController)
        // view.backgroundColor = R.color.white()
        navigationController?.isNavigationBarHidden = true
        view.addSubview(pageController.view)
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
            $0.height.equalTo(240)
        }
    }
    
    private func configureHeaderInfoView() {
        view.addSubview(headerInfoView)
        headerInfoView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(32)
            $0.centerX.equalToSuperview()
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
        view.addSubview(pageController.view)
        pageController.view.snp.makeConstraints {
            $0.top.equalTo(separatorView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }

 }

extension AddEventPageController: AddEventPageControllerAdapter {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let controllers = pageControllers as [UIViewController]
        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
        let nextIndex = viewControllerIndex + 1
        guard pageControllers.count != nextIndex else { return nil }
        guard pageControllers.count > nextIndex else { return nil }
        return controllers[nextIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let controllers = pageControllers as [UIViewController]
        guard let viewControllerIndex = controllers.firstIndex(of: viewController) else { return nil }
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard pageControllers.count > previousIndex else { return nil }
        return controllers[previousIndex]
    }

    func pageViewController(_: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let destinationViewController = pendingViewControllers.first else { return }
        let controllers = pageControllers as [UIViewController]
        guard let viewControllerIndex = controllers.firstIndex(of: destinationViewController) else { return }
        currentIndex = viewControllerIndex
    }
}
