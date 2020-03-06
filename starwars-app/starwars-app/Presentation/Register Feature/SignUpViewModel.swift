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
    var  finishRegister: Driver<Bool?> {get}
    var storeRegister: Driver<Bool?> {get}
    func makeRegister(email: String, password: String)
     func makeRegisterStore(name: String, birthday: String, email: String, password: String)
}

class SignUpViewModel: SignUpContract {
    
    
    private let registerRelay: BehaviorRelay<Bool?> = BehaviorRelay(value: nil)
    var finishRegister: Driver<Bool?> {return registerRelay.asDriver()}
    let registerUseCase: SignUpUseCase
    private let storeRegisterRelay: BehaviorRelay<Bool?> = BehaviorRelay(value: nil)
    var storeRegister: Driver<Bool?> {return storeRegisterRelay.asDriver()}
    let disposeBag = DisposeBag()
    
    
    init(registerUseCase: SignUpUseCase) {
        self.registerUseCase = registerUseCase
    }
    
    func makeRegisterStore(name: String, birthday: String, email: String, password: String){
        registerUseCase.sendData(name: name, birthday: birthday, email: email, password: password).subscribe(onSuccess: { (register) in
            self.storeRegisterRelay.accept(register)
            }).disposed(by: disposeBag)
    }
    
    func makeRegister(email: String, password: String) {
        registerUseCase.registerUser(email: email, password: password).subscribe(onSuccess: { (register) in
            self.registerRelay.accept(register)
        }).disposed(by: disposeBag)
    }
    
    
    
    
}
