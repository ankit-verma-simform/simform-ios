//
//  UIPageControlVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 18/04/23.
//

import UIKit

class MainPageViewController: UIPageViewController {
    
    // MARK: Variables
    lazy var orderedViewControllers = [
        viewControllerWith(name: "PinkViewController"),
        viewControllerWith(name: "YellowViewController")
    ]
    var isLoading: Bool = false
    var currentIndex: Int = 0

    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        self.dataSource = self
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if !isLoading {
            isLoading = true
            setUpControllers()
        }
    }
}

// MARK: Functions
extension MainPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func setUpControllers() {
        currentIndex = 0
        let firstViewController = orderedViewControllers[currentIndex]
        
        setViewControllers([firstViewController], direction: .forward, animated: true)
    }
    
    func viewControllerWith(name: String) -> UIViewController {
        return UIStoryboard(name: "UIPageViewController", bundle: nil)
            .instantiateViewController(withIdentifier: name)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: pageViewController) else {
            return nil
        }
        let prevIndex = index - 1
        guard prevIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[prevIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = orderedViewControllers.firstIndex(of: pageViewController) else {
            return nil
        }
        let nextIndex = index + 1
        guard nextIndex < orderedViewControllers.count else {
            return nil
        }
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        if let firstController = orderedViewControllers.first,
           let index = orderedViewControllers.firstIndex(of: firstController) {
            print(index)
        }
    }
}
