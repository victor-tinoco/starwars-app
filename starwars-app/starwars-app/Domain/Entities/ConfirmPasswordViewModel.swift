//
//  confirmPasswordViewModel.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 10/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol ConformPasswordContract {
    var finishRegister: Driver<String?> {get}
    var storeRegister: Driver<Bool?> {get}
    func makeRegister(password: String)
}

class ConfirmPasswordViewModel: ConformPasswordContract {
    
    let firstRegister: FirstRegister
    
    private let registerRelay: BehaviorRelay<String?> = BehaviorRelay(value: nil)
    var finishRegister: Driver<String?> {return registerRelay.asDriver()}
    let registerUseCase: SignUpUseCase
    private let storeRegisterRelay: BehaviorRelay<Bool?> = BehaviorRelay(value: nil)
    var storeRegister: Driver<Bool?> {return storeRegisterRelay.asDriver()}
    let disposeBag = DisposeBag()
    
    init(registerUseCase: SignUpUseCase, firstRegister: FirstRegister) {
        self.registerUseCase = registerUseCase
        self.firstRegister = firstRegister
    }
    
    func makeRegister(password: String) {
        registerUseCase.registerUser(email: firstRegister.email, password: password).subscribe(onSuccess: { (userID) in
            self.makeRegisterStore(password: password, uid: userID)
        }).disposed(by: disposeBag)
    }
    
    private func makeRegisterStore(password: String, uid: String) {
        registerUseCase.sendData(name: firstRegister.name, birthday: firstRegister.birthday, email: firstRegister.email, password: password, uid: uid).subscribe(onSuccess: { (register) in
            self.storeRegisterRelay.accept(register)
        }).disposed(by: disposeBag)
    }
}
