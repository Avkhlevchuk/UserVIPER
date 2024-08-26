//
//  UserListRouter.swift
//  UserVIPER
//
//  Created by Artem Khlevchuk on 23.08.2024.
//

import Foundation

protocol IUserListRouter {
    static func createModule(ref: UserListViewController)
    func navigateToUserScreen(user: [User]) -> UserViewController
}

class UserListRouter: IUserListRouter {
    static func createModule(ref: UserListViewController) {
        let presenter = UserListPresenter()
        let userListInteractor = UserListInteractor()
        let userLoader = UserLoader()
        let userListRouter = UserListRouter()
        
        ref.presenter = presenter
        presenter.interactor = userListInteractor
        presenter.view = ref
        userListInteractor.userLoader = userLoader
        presenter.nextView = ref
        presenter.userListRouter = userListRouter
        
        presenter.interactor?.presenter = presenter
        
    }
    
    func navigateToUserScreen(user: [User]) -> UserViewController {
        let vc = UserViewController()
        vc.update(user)
        return vc
    }
}


//protocol UserInteractorInput {
//    //UI Events income
//    func viewDidLoad()
//    func userCellSelected(_ index: Int)
//
//    //Datasource
//    func getUsersCount() -> Int
//    func getUser(index: Int) -> User
//}
//
//protocol UserInteractorOutPut {
//    func sendUsersToView(user: [User])
//    func sendUserToViewPresenter(user: [User])
//}
//
//protocol UserViewOutput {
//    var nextView: UserListViewController? { get set }
//    var userListRouter: IUserListRouter? { get set }
//}
//
//protocol UserViewInput {
//    var interactor: IUserListInteractor? { get set }
//    var view: IUserListViewController? { get set }
//}

//class CatalogBuilder: ModuleBuilder {
//    var title: String?
//
//    func setTitle(_ title: String) -> CatalogBuilder {
//        self.title = title
//        return self
//    }
//
//    func build() -> UIViewController {
//        guard let title = title else { fatalError("You should set a title") }
//        let presenter = CatalogPresenter()
//        let interactor = CatalogInteractor(presenter: presenter)
//        let controller = CatalogViewController(title: title, interactor: interactor, loadingDataSource: LoadingTableViewDataSource(), loadingTableDelegate: LoadingTableViewDelegate())
//        presenter.viewController = controller
//        return controller
//    }
//}
