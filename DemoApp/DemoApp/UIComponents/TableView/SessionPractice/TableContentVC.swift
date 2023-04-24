//
//  TableContentTableViewController.swift
//  DemoApp
//
//  Created by Ankit Verma on 24/04/23.
//

import UIKit

class TableContentVC: UIViewController {
    // MARK: - IB Outlets
    @IBOutlet private weak var tblContents: UITableView!
    @IBOutlet private var tblHeaderView: UIView!
    @IBOutlet private var tblSectionHeaderView: UIView!
    @IBOutlet private var tblSectionFooterView: SectionFooterView!
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        tblContents.register(UINib(nibName: "IndexTableViewCell", bundle: nil),
                             forCellReuseIdentifier: "IndexTableViewCell")
        tblContents.register(UINib(nibName: "Multiple5TableViewCell", bundle: nil),
                             forCellReuseIdentifier: "Multiple5TableViewCell")
        tblContents.tableHeaderView = tblHeaderView
    }
}

// MARK: - Methods for UITableView Datasource
extension TableContentVC: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if indexPath.row % 5 == 0 {
                guard let multiple5Cell = tblContents.dequeueReusableCell(
                    withIdentifier: "Multiple5TableViewCell") as? Multiple5TableViewCell else {
                    return UITableViewCell()
                }
                multiple5Cell.lblText.text = "\(indexPath.section):\(indexPath.row)"
                return multiple5Cell
            } else {
                guard let cell = tblContents.dequeueReusableCell(
                    withIdentifier: "IndexTableViewCell") as? IndexTableViewCell else {
                    return UITableViewCell()
                }
                cell.backgroundColor = .systemGray6
                return cell
            }
        }
    
    func tableView(
        _ tableView: UITableView,
        heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

// MARK: - Methods for UITableView Delegate
extension TableContentVC: UITableViewDelegate {
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    
    func tableView(
        _ tableView: UITableView,
        titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForHeaderInSection section: Int) -> UIView? {
        tblSectionHeaderView.backgroundColor = .systemCyan
        return tblSectionHeaderView
    }
    
    func tableView(
        _ tableView: UITableView,
        viewForFooterInSection section: Int) -> UIView? {
            var footerView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.size.width, height: 128))
            footerView.backgroundColor = .cyan
            return footerView
    }
    
    func tableView(
        _ tableView: UITableView,
        heightForFooterInSection section: Int) -> CGFloat {
        return 128
    }
}
