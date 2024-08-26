//
//  ViewController.swift
//  mvp-users
//
//  Created by Artur on 11.08.2024.
//
import UIKit

protocol IUserListViewController {
    //Connections
    var presenter: UserListInteractorInput? { get set }
    
    //Update View
    func reloadTable()
}

class UserListViewController: UIViewController, IUserListViewController {
    
    var presenter: UserListInteractorInput?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init()
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        tableView.rowHeight = 100
        tableView.register(UserCell.self, forCellReuseIdentifier: UserCell.reuseId)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupConstraints()
        presenter?.fetchUsers()
    }
}

extension UserListViewController {
    func reloadTable() {
        tableView.reloadData()
    }
}

extension UserListViewController {
    
    func setupViews() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
    }
}

extension UserListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return users.count
        return  presenter?.getUsersCount() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UserCell.reuseId, for: indexPath) as! UserCell
        
        if let user = presenter?.getUser(index: indexPath.row) {
            cell.update(user)
        }
       
        return cell
    }
}

extension UserListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: false)
        
        presenter?.userCellSelected(indexPath.row)
    }
}
