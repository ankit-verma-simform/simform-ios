//
//  MainNavigationVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 16/05/23.
//

import UIKit

class MainNavigationVC: UIViewController {
    // MARK: - Variables
    private let storyboards = Storyboard.allCases

    // MARK: - IB Outlets
    @IBOutlet private weak var navigationTable: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - TableView DataSource & Delegate Methods
extension MainNavigationVC: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyboards.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let navigationCell = tableView.dequeueReusableCell(
            withIdentifier: NavigationTVCell.identifier) as? NavigationTVCell else {
            return UITableViewCell()
        }
        navigationCell.delegate = self
        navigationCell.configure(with: storyboards[indexPath.row].storyboardName, indexPath: indexPath)
        
        return navigationCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Functions
extension MainNavigationVC {
    private func initialSetup() {
        navigationTable.delegate = self
        navigationTable.dataSource = self
    }
}

// MARK: - SendIndex Delegate Method
extension MainNavigationVC: SendIndexPath {
    func didTapWithIndexPath(indexPath: IndexPath) {
        let storyboardToGo = storyboards[indexPath.row]
        let storyboard = UIStoryboard(name: storyboardToGo.storyboardName, bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: storyboardToGo.initialViewControllerName)
        navigate(to: vc)
    }
}
