//
//  UserListViewModel.swift
//  PhotoAlbum
//
//  Created by Onur Torna on 10.04.2019.
//  Copyright © 2019 Onur Torna. All rights reserved.
//

import Foundation

/// Contains current state's information
final class UserListState {

    enum Change {
        case loading(Bool)
        case error(Error?)
        case dataFetch
    }

    /// On change block
    var onChange: ((UserListState.Change) -> Void)?

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

    var users: [User] = [] {
        didSet {
            onChange?(.dataFetch)
        }
    }
}

final class UserListViewModel {

    private let dataController: UserListDataProtocol
    private let state = UserListState()

    /// State change handler
    var stateChangeHandler: ((UserListState.Change) -> Void)? {
        get {
            return state.onChange
        }

        set {
            state.onChange = newValue
        }
    }

    var userCount: Int {
        return state.users.count
    }

    init(dataController: UserListDataProtocol) {
        self.dataController = dataController
    }

    func user(at index: Int) -> User {
        return state.users[index]
    }

    func fetchUsers() {
        state.isLoading = true
        dataController.fetchUsers { [weak self] (users, error) in
            self?.state.isLoading = false
            self?.state.receivedError = error
            guard let self = self,
                error == nil else { return }

            self.state.users = users ?? []
        }
    }
}
