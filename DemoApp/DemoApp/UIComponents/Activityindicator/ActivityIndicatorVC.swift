//
//  ActivityIndicatorVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/05/23.
//

import UIKit

class ActivityIndicatorVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet private weak var stackView: UIStackView!
    private var i = 0
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.hidesWhenStopped = true
    }
}

// MARK: - IB Actions
extension ActivityIndicatorVC {
    @IBAction private func btnAddItemToStack(_ sender: UIButton) {
        activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            guard let self else {
                return
            }
            self.addItemToStack()
            self.activityIndicator.stopAnimating()
        }
    }
}

// MARK: - Functions
extension ActivityIndicatorVC {
    func addItemToStack() {
        let itemView = UILabel()
        itemView.text = String(i)
        itemView.textAlignment = .center
        itemView.backgroundColor = i % 2 == 0 ? .systemGray6 : .systemGray5
        stackView.addArrangedSubview(itemView)
        i += 1
    }
}

