//
//  SingUpService.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import FirebaseAuth
import FirebaseFirestore

class SignUpService {
    
    let db = Firestore.firestore()
    
    func registerUser(email:String, password:String) -> Single<String> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: email, password: password, completion: { user, error in
                if error != nil {
                    single(.success(""))
                    print("Erro ao cadastrar")
                    return
                }else {
                    guard let userUid = user?.user.uid else {
                        //retorna erro
                        return }
                    single(.success(userUid))
                    print("Usuário cadastrado")
                    return
                }
            })
            return Disposables.create()
        }
    }
    
    func sendData(name: String, birthday:String, email:String, password:String, uid: String?) -> Single<Bool> {
        return Single.create { single in
            
            self.db.document("/users/\(uid!)/").setData([
                "name": name,
                "birthday": birthday,
                "email": email,
                "password": password], merge: true) { err in
                    if let err = err {
                        single(.success(false))
                        print("Error adding document: \(err)")
                    } else {
                        single(.success(true))
                    }
            }
            return Disposables.create()
        }
    }
}
