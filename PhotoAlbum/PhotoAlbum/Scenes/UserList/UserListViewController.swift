//
//  UserListViewController.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

class UserListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let viewModel = UserListViewModel(dataController: UserListDataController())

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.register(UserListCell.defaultNib,
                           forCellReuseIdentifier: UserListCell.defaultNibName)

        viewModel.stateChangeHandler = applyState(_:)
        viewModel.fetchUsers()
    }
}

// MARK: - Helpers
private extension UserListViewController {

    func applyState(_ change: UserListState.Change) {

        switch change {
        case .loading(let isLoading):
            // TODO: Show/hide loading view
            break

        case .error(let receivedError):
            // TODO: Show/hide error view
            break

        case .dataFetch:
            tableView.reloadData()
        }
    }
}

extension UserListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.userCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: UserListCell.defaultNibName) as? UserListCell else {
            return UITableViewCell()
        }

        let user = viewModel.user(at: indexPath.row)
        cell.customizeCell(with: user)
        
        return cell
    }
}
