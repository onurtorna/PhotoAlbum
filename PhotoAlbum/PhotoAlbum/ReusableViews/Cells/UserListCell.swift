//
//  UserListCell.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit

final class UserListCell: UITableViewCell, NibLoadable {

    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var albumCoverImageView: UIImageView!
}
