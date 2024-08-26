//
//  Avatar.swift
//  TestUserMVC
//
//  Created by Artem Khlevchuk on 18.08.2024.
//

import UIKit

enum AvatarStyle {
    case mainAvatar
    case customeCellAvatar
}

class Avatar: UIImageView {
    
    init(style: AvatarStyle) {
        super.init(frame: .zero)
        
        switch style {
        case .mainAvatar:
            commonInit()
        case .customeCellAvatar:
            initForCustomeCellAvatar()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit() {
        self.image = UIImage(named: "person.crop.circle")
        let width = UIScreen.main.bounds.width
        self.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        self.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
    }
    
    func initForCustomeCellAvatar() {
        self.image = UIImage(named: "person.crop.circle")
        self.contentMode = .scaleAspectFill
        let width = UIScreen.main.bounds.width
        self.heightAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
        self.widthAnchor.constraint(equalToConstant: 0.2 * width).isActive = true
    }
}
