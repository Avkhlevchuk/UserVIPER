//
//  NameLabel.swift
//  TestUserMVC
//
//  Created by Artem Khlevchuk on 18.08.2024.
//

import UIKit

enum LabelStyle: Int {
    case commonText
    case centerText
}

class Label: UILabel {
    
    init(style: LabelStyle, text: String) {
        super.init(frame: .zero)
        
        switch style {
        case .centerText:
            centerInit(text: text)
        case .commonText:
            commonInit(text: text)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func commonInit(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 15)
    }
    
    func centerInit(text: String) {
        self.text = text
        self.font = UIFont.systemFont(ofSize: 25)
        self.textAlignment = .center
    }
    
}
