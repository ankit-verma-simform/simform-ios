//
//  ExploreUsersVC.swift
//  DemoApp
//
//  Created by Ankit Verma on 03/07/23.
//

import UIKit

class ExploreUsersVC: UIViewController {
    // MARK: - Variables
    private lazy var viewModel = ExploreUsersViewModel()

    // MARK: - IB Outlets
    @IBOutlet private weak var tblUsers: UITableView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
}

// MARK: - UI Table View Delegate Methods
extension ExploreUsersVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.users.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let userCell = tableView.dequeueReusableCell(withIdentifier: R.nib.exploreUsersTVCell, for: indexPath) else {
            return UITableViewCell()
        }
        userCell.configure(with: viewModel.users.value[indexPath.row])
        return userCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - Functions
extension ExploreUsersVC {
    private func setupTableView() {
        tblUsers.dataSource = self
        tblUsers.delegate = self
        tblUsers.register(R.nib.exploreUsersTVCell)
        viewModel.users.bind { [weak self] users in
            DispatchQueue.main.async {
                self?.tblUsers.reloadData()
            }
        }
    }
}
