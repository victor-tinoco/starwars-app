//
//  LoginViewModel.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol LoginViewModelContract {
    func goLogin(email: String, password: String) 
}

public class LoginViewModel: LoginViewModelContract {
    let disposeBag = DisposeBag()
    var usecase: LoginUseCase
    
    private let loginRelay: BehaviorRelay<Bool?> =
        BehaviorRelay(value: nil)
       public var login: Driver<Bool?>{ return
           loginRelay.asDriver() }
    
    public func goLogin(email: String, password: String){
        usecase.goLogin(email: email, password: password).subscribe(onSuccess: { sw in
            self.loginRelay.accept(sw)
            }).disposed(by: disposeBag)
        
    
     }
    
    init(usecase: LoginUseCase) {
        self.usecase = usecase
        
    }
    
}

   

