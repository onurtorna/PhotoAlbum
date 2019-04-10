//
//  UserListCell.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import UIKit
import Kingfisher

final class UserListCell: UITableViewCell, NibLoadable {

    @IBOutlet private weak var userNameLabel: UILabel!
    @IBOutlet private weak var albumCoverImageView: UIImageView!

    func customizeCell(with user: User) {
        userNameLabel.text = user.fullname
        if let imageString = user.albums?.first?.photos?.first?.url,
            let imageUrl = URL(string: imageString) {
            albumCoverImageView.kf.setImage(with: imageUrl)
        }
    }
}
