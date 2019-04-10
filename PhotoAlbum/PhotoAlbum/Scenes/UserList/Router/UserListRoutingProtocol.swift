//
//  UserListRoutingProtocol.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

protocol UserListRoutingProtocol {

    /// Routes to user detail with given user
    func viewControllerDidRequestUserDetail(_ viewController: UIViewController,
                                            user: User)
}
