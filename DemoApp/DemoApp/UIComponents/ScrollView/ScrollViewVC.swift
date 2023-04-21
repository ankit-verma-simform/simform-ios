//
//  ScrollViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class ScrollViewVC: UIViewController {
    // MARK: IB Outlets
    @IBOutlet private weak var scrollView: UIScrollView!
    
    // MARK: View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
}

// MARK: Delegate Methods for UIScrollView
extension ScrollViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("user scrolled the screen")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("User started scroll")
    }
    
    func scrollViewWillEndDragging(
        _ scrollView: UIScrollView,
        withVelocity velocity: CGPoint,
        targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("User ended scroll")
    }
}
