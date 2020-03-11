//
//  SingUpViewModel.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol SignUpContract {
    var finishRegister: Driver<String?> {get}
    var storeRegister: Driver<Bool?> {get}
    func makeRegister(name: String, birthday: String, email: String, password: String)
}

class SignUpViewModel: SignUpContract {
    private let registerRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var finishRegister: Driver<String?> {return registerRelay.asDriver()}
    let registerUseCase: SignUpUseCase
    private let storeRegisterRelay: BehaviorRelay<Bool?> = BehaviorRelay(value: nil)
    var storeRegister: Driver<Bool?> {return storeRegisterRelay.asDriver()}
    let disposeBag = DisposeBag()
    
    init(registerUseCase: SignUpUseCase) {
        self.registerUseCase = registerUseCase
        
        storeRegister.drive(onNext: { (register) in
            if register == true {
                print("Cadastrado com Sucesso no Firebase Store")
            }else {
                print("Error Firebase Store")
            }
        }).disposed(by: disposeBag)
    }
    
    func makeRegister(name: String, birthday: String, email: String, password: String) {
        registerUseCase.registerUser(email: email, password: password).subscribe(onSuccess: { (userID) in
            self.registerRelay.accept(userID)
        }).disposed(by: disposeBag)
        
        func makeRegisterStore(name: String, birthday: String, email: String, password: String, uid: String) {
            registerUseCase.sendData(name: name, birthday: birthday, email: email, password: password, uid: uid).subscribe(onSuccess: { (register) in
                self.storeRegisterRelay.accept(register)
            }).disposed(by: disposeBag)
        }
    }
    
}
