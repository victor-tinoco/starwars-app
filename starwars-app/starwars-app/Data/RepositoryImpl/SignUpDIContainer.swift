//
//  SignUpDIContainer.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class SignUpDIContainer:SignupRoutes {
    
    func makeConfirmPassViewController(userModel: RegisterCombo) -> SignUpViewController {
        return SignUpViewController.instantiate(viewModel: <#T##SignUpContract#>, routes: <#T##SignupRoutes#>)
    }
}
