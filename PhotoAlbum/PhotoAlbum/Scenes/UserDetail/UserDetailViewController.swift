//
//  UserDetailViewController.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class UserDetailViewController: UIViewController, StoryboardLoadable {

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var albumsCollectionView: UICollectionView!

    static var defaultStoryboardName: String = "UserList"

    var viewModel: UserDetailViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.stateChangeHandler = applyState(_:)
    }
}

// MARK: - Helpers
private extension UserDetailViewController {

    func applyState(_ change: UserDetailState.Change) {

        switch change {
        case .loading(let isLoading):
            // TODO: Show/hide loading view
            break

        case .error(let receivedError):
            // TODO: Show/hide error view
            break

        case .initial(name: let name):
            userNameLabel.text = name
        }
    }
}
