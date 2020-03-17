//
//  ResetPasswordService.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import FirebaseAuth
import RxSwift
import RxCocoa

class ResetPasswordService {
    
    func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil) -> Single<Bool> {
        return Single.create { single in
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                
                if error != nil{
                    single(.success(false))
                    print ("e cago")
                    return
                }else {
                    single(.success(true))
                    print("o resetin deu bom")
                    return
                }
                
            }
            return Disposables.create()
        }
    }
}
