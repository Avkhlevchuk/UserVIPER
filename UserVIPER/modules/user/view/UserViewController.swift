//
//  User.swift
//  mvp-users
//
//  Created by Artur on 21.08.2024.
//

import UIKit

class UserViewController: UIViewController {
    
    var avatar = Avatar.init(style: .mainAvatar)
    var label = Label(style: .centerText, text: "" )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
       
        setView()
        setConstrains()
    }
    
    func setView() {
        view.addSubview(avatar)
        view.addSubview(label)
    }
    
    func setConstrains() {
        
        avatar.translatesAutoresizingMaskIntoConstraints = false
        label.translatesAutoresizingMaskIntoConstraints = false
        
        let margins = view.layoutMarginsGuide
        
        NSLayoutConstraint.activate([
            avatar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            avatar.topAnchor.constraint(equalTo: margins.topAnchor),
            avatar.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            avatar.bottomAnchor.constraint(equalTo: self.view.centerYAnchor),
        ])
        
        NSLayoutConstraint.activate([
            label.widthAnchor.constraint(equalToConstant: 200),
            label.heightAnchor.constraint(equalToConstant: 50),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20)
            ])
    }
}

////MARK: - PresenterView
extension UserViewController {
    func update(_ user: [User]) {
        label.text = "\(user[0].firstName) \(user[0].lastName)"
        let url = URL(string: user[0].avatar)
        avatar.kf.setImage(with: url)
    }
}
