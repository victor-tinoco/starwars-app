//
//  confirmPassword.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 10/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit


class ConfirmPasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
   
    
    static func instantiate(viewModel: ConfirmPasswordViewModel) -> ConfirmPasswordViewController {
        let storyboard = UIStoryboard(name: "confirmPassword", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ConfirmPasswordViewController") as! ConfirmPasswordViewController
        return view
    }
    
}
