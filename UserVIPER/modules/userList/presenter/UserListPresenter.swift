//
//  UserListPresenter.swift
//  mvp-users
//
//  Created by Artur on 21.08.2024.
//

import Foundation

protocol UserListInteractorInput {
    //UI Events income
    func fetchUsers()
    func userCellSelected(_ index: Int)
    
    //Datasource
    func getUsersCount() -> Int
    func getUser(index: Int) -> User
}

protocol UserListViewInput {
    var interactor: IUserListInteractor? { get set }
    var view: IUserListViewController? { get set }
}

protocol UserListInteractorOutput {
    func fetchedUsers(user: [User])
    func fetchedUser(user: [User])
}

protocol UserListViewOutput {
    var nextView: UserListViewController? { get set }
    var userListRouter: IUserListRouter? { get set }
}

class UserListPresenter: UserListInteractorInput, UserListViewInput {
    var view: IUserListViewController?
    var interactor: IUserListInteractor?
    var userListRouter: IUserListRouter?
    var nextView: UserListViewController?
 
    var users: [User] = [] {
        didSet {
            view?.reloadTable()
        }
    }
}

//MARK: - Event Handler
extension UserListPresenter {
    func fetchUsers() {
        interactor?.fetchUsers()
    }
    func userCellSelected(_ index: Int) {
        interactor?.userCellSelected(index)
    }
}


//MARK: - Datasource
extension UserListPresenter {
    func getUsersCount() -> Int {
        return interactor?.getUsersCount() ?? 0
        
    }
    func getUser(index: Int) -> User {
        return (interactor?.getUser(index: index))!
        
    }
}

//MARK: - Send data to view from iteractor to presenter

extension UserListPresenter: UserListInteractorOutput, UserListViewOutput {
    
    func fetchedUsers(user: [User]) {
        users = user
    }
    func fetchedUser(user: [User]) {
        
        let vc = userListRouter?.navigateToUserScreen(user: user)
       
        nextView?.present(vc!, animated: true)
    }
}
