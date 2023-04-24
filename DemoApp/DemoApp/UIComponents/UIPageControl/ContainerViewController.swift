//
//  ContainerViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class ContainerViewController: UIViewController {
    // MARK: - IB Outlet
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var pvcContainer: UIView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "pageViewControllerSegue",
              let pageViewController = segue.destination as? MainPageViewController else { return }
        pageViewController.pageControlDelegate = self
    }
}

// MARK: - Extension for PageControlDelegate
extension ContainerViewController: PageControlDelegate {
    func totalPages(pages: Int) {
        pageControl.numberOfPages = pages
    }
    
    func onCurrentIndexChanged(newIndex: Int) {
        pageControl.currentPage = newIndex
    }
}

// MARK: - Protocol for PageControlDelegate
/**
 This protocol defines methods for message passing between PageControl's Container View Controller from PageViewController
 */
protocol PageControlDelegate: AnyObject {
    func onCurrentIndexChanged(newIndex: Int)
    func totalPages(pages: Int)
}
