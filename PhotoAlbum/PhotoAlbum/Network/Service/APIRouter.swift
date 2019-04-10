//
//  APIRouter.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Alamofire

enum APIRouter {

    case userList

    // MARK: - Request
    var request: Alamofire.DataRequest {

        var encodingMethod: ParameterEncoding = URLEncoding.default
        if method == .post {
            encodingMethod = JSONEncoding.default
        }

        return NetworkManager.sessionManager.request(url!,
                                                     method: method,
                                                     parameters: parameters,
                                                     encoding: encodingMethod,
                                                     headers: nil)
    }

    // MARK: - HTTPMethod
    var method: HTTPMethod {

        switch self {
        case .userList:
             return .get
        }
    }

    // MARK: - URL
    private var url: URL? {
        let baseUrl = URL(string: "https://my-json-server.typicode.com/onurtorna/PhotoAlbum/")
        let url = baseUrl?.appendingPathComponent(path)
        return url
    }

    // MARK: - PATH
    private var path: String {

        switch self {
        case .userList:
            return "db"
        }
    }

    private var parameters: Parameters? {

        switch self {
        case .userList:
            return nil
        }
    }
}


