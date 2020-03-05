//
//  SignUpDIContainer.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit


class SignUpDIContainer{
    
    var signUpImpl: SignUpRepositorImpl {
        return SignUpRepositorImpl()
    }
    
    var signUpUseCase:SignUpUseCase{
        return SignUpUseCase(signUpImpl: signUpImpl)
    }
    
    var vm: SignUpViewModel{
        return SignUpViewModel(registerUseCase: signUpUseCase)
    }
    
    func makePeopleListViewController(appDI: AppDIContainer) -> SignUpViewController {
        return SignUpViewController.instantiate(viewModel: vm)
     }
    
}
