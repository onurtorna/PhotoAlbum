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

}
