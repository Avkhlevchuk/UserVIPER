//
//  User.swift
//  mvp-users
//
//  Created by Artur on 21.08.2024.
//

import Foundation

struct User: Codable {
    
    var id: Int
    var email: String
    var firstName: String
    var lastName: String
    var avatar: String
}

struct UserData: Decodable {
    
    let data: [User]
}
