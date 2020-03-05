//
//  SingUpViewController.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift


class SignUpViewController: UIViewController{
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var viewModel: SignUpContract!
    let disposedBag = DisposeBag()
    
    
    func completedRegister(){
        if let email = emailTextField.text, let password = passwordTextField.text{
            guard let register = viewModel?.makeRegister(email: email, password: password) else {return}
        }
    }
}
