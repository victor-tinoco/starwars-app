//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
    
    let signUpDI = SignUpDIContainer()
    var window: UIWindow?
    
    
    public func makeHomeViewController() -> LoginViewController {
        return LoginViewController.create(delegate: self, viewModel: LoginViewModel(usecase: LoginUseCase(loginRepository: LoginRepositoryImpl())))
        
    }
    
    func makeConfirmPassViewController(firstRegister: FirstRegister) -> ConfirmPasswordViewController {
        let repoImpl = SignUpRepositorImpl()
        let useCase = SignUpUseCase(signUpImpl: repoImpl)
        let vm = ConfirmPasswordViewModel(registerUseCase: useCase, firstRegister: firstRegister)
        return ConfirmPasswordViewController.instantiate(viewModel: vm)
    }
    
    func makeSignUpViewController() -> SignUpViewController {
        let signUpRepo = SignUpRepositorImpl()
        let signUpUseCase = SignUpUseCase(signUpImpl: signUpRepo)
        let vm = SignUpViewModel()
        return SignUpViewController.instantiate(viewModel: vm)
    }
}

extension AppDIContainer: LoginViewControllerDelegate {
    func didTouchButtonLogin() -> UIViewController {
        let loginRepository = LoginRepositoryImpl()
        let usecase = LoginUseCase(loginRepository: loginRepository)
        let vm = StarWarsViewController()
        let vc = StarWarsViewController.instantiate()
        
        return vc
    }
}
