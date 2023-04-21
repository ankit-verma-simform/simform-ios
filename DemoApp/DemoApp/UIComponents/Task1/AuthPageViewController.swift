//
//  AuthPageViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class AuthPageViewController: UIPageViewController {
    // MARK: Variables
    lazy private var orderedViewControllers: [UIViewController?] = [
        SignUpViewController.create(storyboardName: .task1),
        LoginViewController.create(storyboardName: .task1)
    ]
    private var viewControllersLoaded = false

    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self
        dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !viewControllersLoaded {
            setupViewControllers()
            viewControllersLoaded = true
        }
    }
}

// MARK: Functions
extension AuthPageViewController {
    private func setupViewControllers() {
        guard let firstViewController = orderedViewControllers.first ?? nil else { return }
        setViewControllers([firstViewController], direction: .forward, animated: true)
    }
}

// MARK: Delegate Methods
extension AuthPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = pageViewController.viewControllers?.first,
              let currentIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let prevIndex = currentIndex - 1
        guard prevIndex >= 0 else { return nil }
        return orderedViewControllers[prevIndex]
    }
    
    func pageViewController(
        _ pageViewController: UIPageViewController,
        viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = pageViewController.viewControllers?.first,
              let currentIndex = orderedViewControllers.firstIndex(of: viewController) else {
            return nil
        }
        let nextIndex = currentIndex + 1
        guard nextIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
}
