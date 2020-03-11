//
//  User.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 10/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

struct RegisterCombo {
    let name: String
    let email: String
    let birthday: String
    let password: String
    
    init(name: String, password: String, birthday: String, email: String) {
        self.name = name
        self.password = password
        self.email = email
        self.birthday = birthday
    }
}


struct FirstRegister {
    let name: String
    let email: String
    let birthday: String
    
    init(name:String, birthday: String, email:String) { 
        self.name = name
        self.birthday = birthday
        self.email = email
    }
}
