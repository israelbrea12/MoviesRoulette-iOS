//
//  UserMapper.swift
//  MovieRoulette
//
//  Created by Israel Brea Piñero on 16/3/25.
//

import Foundation

extension UserModel {
    func toDomain() -> User {
        return User(id: self.uid, fullName: self.fullName, email: self.email)
    }
}
