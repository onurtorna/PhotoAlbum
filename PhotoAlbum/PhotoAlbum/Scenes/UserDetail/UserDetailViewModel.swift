//
//  UserDetailViewModel.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

final class UserDetailState {

    enum Change {
        case loading(Bool)
        case error(Error?)
        case initial(name: String)
    }

    /// On change block
    var onChange: ((UserDetailState.Change) -> Void)?

    /// Indicates the current loading state
    var isLoading = false {
        didSet {
            onChange?(.loading(isLoading))
        }
    }

    /// Received error
    var receivedError: Error? {
        didSet {
            onChange?(.error(receivedError))
        }
    }

    var user: User

    init(user: User) {
        self.user = user
    }
    
}

final class UserDetailViewModel {

    private let state: UserDetailState

    /// State change handler
    var stateChangeHandler: ((UserDetailState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
            state.onChange?(.initial(name: state.user.fullname))
        }
    }

    init(user: User) {
        state = UserDetailState(user: user)
    }
}
