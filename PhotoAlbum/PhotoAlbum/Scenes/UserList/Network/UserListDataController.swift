//
//  UserListDataController.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class UserListDataController: UserListDataProtocol {

    func fetchUsers(completion: @escaping ([User]?, Error?) -> Void) {

        APIClient.userList { (response, error) in
            completion(response?.users, error)
        }
    }
}
