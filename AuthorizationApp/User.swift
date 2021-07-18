//
//  Person.swift
//  AuthorizationApp
//
//  Created by Kristina Shlyapkina on 17.07.2021.
//

import Foundation

struct User {
    let login: String
    let password: String
    let person: Person

    static func getUser() -> User {
        User(login: "User", password: "Password", person: Person.getPerson())
    }

}
