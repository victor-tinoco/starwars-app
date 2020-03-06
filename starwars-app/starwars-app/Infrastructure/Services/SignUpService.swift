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
    
    func sendData(name: String, birthday:String, email:String, password:String) -> Single<Bool>{
        return Single.create { single in
            var ref: DocumentReference? = nil
            ref = self.db.collection("users").addDocument(data: [
                "name": name,
                "birthday": birthday,
                "email": email,
                "password": password
            ]){ err in
                if let err = err {
                    single(.success(false))
                    print("Error adding document: \(err)")
                } else {
                    single(.success(true))
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
            return Disposables.create()
        }
    }
    
    func registerUser(email:String, password:String) -> Single<Bool> {
        return Single.create { single in
            Auth.auth().createUser(withEmail: email, password: password, completion:{ user, error in
                if error != nil {
                    single(.success(false))
                    print("Erro ao cadastrar")
                    return
                }else {
                    single(.success(true))
                    
                    print("Usuário cadastrado")
                    return
                }
            })
            return Disposables.create()
        }
    }
}
