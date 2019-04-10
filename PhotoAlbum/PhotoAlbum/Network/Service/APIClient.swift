//
//  APIClient.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Alamofire

final class APIClient {

    static func userList(completion: @escaping (UserListResponse?, Error?) -> Void) {

        APIRouter.userList.request.responseJSON { (dataResponse) in

                ServiceManager.handleResponse(dataResponse,
                                              of: UserListResponse.self,
                                              completion: completion)
        }
    }
}
