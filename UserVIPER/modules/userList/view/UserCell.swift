//
//  UserCell.swift
//  mvp-users
//
//  Created by Artur on 21.08.2024.
//

import UIKit
import Kingfisher
import SnapKit

class UserCell: UITableViewCell{
   
    static let reuseId = "Cell"
    
    var containerView: UIView = {
       var view = UIView()
        view.backgroundColor = .white
        return view
    }()
    
    var verticalStackView: UIStackView = {
        var stackView = UIStackView.init()
        stackView.axis = .vertical
        stackView.spacing = 15
        stackView.alignment = .leading
        stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 8, trailing: 0) // Внутриненние отступы
        stackView.isLayoutMarginsRelativeArrangement = true
        return stackView
    }()
    
    var firstName = Label.init(style: .commonText, text: "")
    
    var lastName = Label.init(style: .commonText, text: "")
    
    var userAvatar = Avatar(style: .customeCellAvatar)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(userAvatar)
        containerView.addSubview(verticalStackView)
        
        verticalStackView.addArrangedSubview(firstName)
        verticalStackView.addArrangedSubview(lastName)
    }
    
    func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.bottom.equalTo(contentView).inset(8)
        }
        
        userAvatar.snp.makeConstraints { make in
            make.left.equalTo(contentView).offset(8)
            make.centerY.equalTo(contentView)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.right.bottom.equalTo(contentView).inset(8)
            make.left.equalTo(userAvatar.snp.right).offset(8)
        }
    }
    
    func update(_ user: User) {
        
        firstName.text = user.firstName
        lastName.text = user.lastName
        
        let url = URL(string: user.avatar)
        userAvatar.kf.setImage(with: url)
    }
    
}
