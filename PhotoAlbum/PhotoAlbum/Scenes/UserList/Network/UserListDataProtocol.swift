//
//  UserListDataProtocol.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

protocol UserListDataProtocol: class {

    /// Fetches all users
    ///
    /// - Parameter completion: Completion Block
    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void)
}
