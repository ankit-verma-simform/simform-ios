//
//  GolfHomeScreenVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 17/05/23.
//

import UIKit

class GolfHomeScreenVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var golfHomeTable: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
}

// MARK: - Functions
extension GolfHomeScreenVC {
    private func initialSetup() {
        setupNavBar()
        setupGolfHomeTable()
    }
    
    private func setupNavBar() {
        navigationController?.isNavigationBarHidden = true
    }
    
    private func setupGolfHomeTable() {
        golfHomeTable.delegate = self
        golfHomeTable.dataSource = self
        let golfHomeHeaderView = GolfHomeHeaderView(frame: CGRect(x: 0,
                                                                  y: 0,
                                                                  width: golfHomeTable.frame.size.width,
                                                                  height: 700))
        golfHomeTable.tableHeaderView = golfHomeHeaderView
    }
}

// MARK: - GolfHomeTable DataSource Methods
extension GolfHomeScreenVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

// MARK: - GolfHomeTable Delegate Methods
extension GolfHomeScreenVC: UITableViewDelegate {
    
}
