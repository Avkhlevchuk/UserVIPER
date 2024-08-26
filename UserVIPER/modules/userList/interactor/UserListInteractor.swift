//
//  Interactor.swift
//  UserVIPER
//
//  Created by Artem Khlevchuk on 22.08.2024.
//

import Foundation

protocol IUserListInteractor {
    
    var presenter: UserListInteractorOutput? { get set }
    var userLoader: IUserLoader? { get set }
    
    func fetchUsers()
    func userCellSelected(_ index: Int)
    func getUsersCount() -> Int
    func getUser(index: Int) -> User
}

class UserListInteractor: IUserListInteractor {
    
    var presenter: UserListInteractorOutput?
    
    var view: IUserListViewController?
    var userLoader: IUserLoader?
    
    var users: [User] = []
    
    func fetchUsers() {
        userLoader?.fetchUsers { [weak self] result in
             switch result {
             case .success(let users):
                 self?.users = users
                 self?.presenter?.fetchedUsers(user: users)
             case .failure(let error):
                 print(error)
             }
         }
    }
    
    func userCellSelected(_ index: Int) {
        let user = [users[index]]
        presenter?.fetchedUser(user: user)
    }
    
    func getUsersCount() -> Int {
        return users.count
    }
    
    func getUser(index: Int) -> User {
        return users[index]
        
    }
    
}
