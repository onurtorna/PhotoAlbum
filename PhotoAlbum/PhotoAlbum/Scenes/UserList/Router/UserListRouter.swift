//
//  UserListRouter.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class UserListRouter: UserListRoutingProtocol {

    func viewControllerDidRequestUserDetail(_ viewController: UIViewController,
                                            user: User) {

        let detailViewController = UserDetailViewController.loadFromStoryboard()
        viewController.navigationController?.pushViewController(detailViewController,
                                                                animated: true)
    }
}
