//
//  ServiceManager.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Alamofire

final class ServiceManager: NSObject {

    static let decoder = JSONDecoder()

    /// Parses response and returns data and error
    ///
    /// - Parameters:
    ///   - response: Data response to handle
    ///   - type: Type of the response
    ///   - completion: Completion block
    static func handleResponse<R: Response>(_ response: DataResponse<Any>,
                                            of type: R.Type,
                                            completion: (R?, Error?) -> Void) {

        let error = ErrorHandler.error(from: response)
        guard let responseData = response.data else {
            completion(nil, error)
            return
        }

        parseResponseData(responseData,
                          of: R.self,
                          error: error,
                          completion: completion)
    }
}

// MARK: - Helpers
private extension ServiceManager {

    static func parseResponseData<R: Decodable>(_ data: Data,
                                                of type: R.Type,
                                                error: Error?,
                                                completion: (R?, Error?) -> Void) {

        do {
            let decodedObject = try decoder.decode(R.self, from: data)
            completion(decodedObject, error)
        } catch {
            completion(nil, error)
        }
    }
}
