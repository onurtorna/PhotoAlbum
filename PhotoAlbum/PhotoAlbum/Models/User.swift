//
//  User.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

struct User: Codable {
    var id: String
    var albums: [Album]?
}
