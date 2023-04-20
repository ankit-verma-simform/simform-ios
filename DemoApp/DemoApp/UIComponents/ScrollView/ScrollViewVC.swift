//
//  ScrollViewVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 19/04/23.
//

import UIKit

class ScrollViewVC: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
    }
}

extension ScrollViewVC: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("user scrolled the screen")
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("User started scroll")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        print("User ended scroll")
    }
}
