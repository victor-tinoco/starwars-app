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


class SignUpViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    
    @IBOutlet weak var btnConfirm: UIButton!
    var viewModel: SignUpContract!
    let disposedBag = DisposeBag()
    let appDI = AppDIContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    static func instantiate(viewModel: SignUpContract) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        view.viewModel = viewModel
        return view
    }
    
    func bind() {
        btnConfirm.rx.tap.bind {
            if let email = self.emailTextField.text, let password = self.passwordTextField.text, let name = self.nameTextField.text, let birthday = self.birthdayTextField.text {
                self.viewModel.makeRegister(email: email, password: password)
                
                
            }
        }.disposed(by: disposedBag)
        
        self.viewModel.finishRegister.drive(onNext: { (register) in
            if (register != nil) {
                if let email = self.emailTextField.text, let password = self.passwordTextField.text, let name = self.nameTextField.text, let birthday = self.birthdayTextField.text{
                    self.viewModel.makeRegisterStore(name: name, birthday: birthday, email: email, password: password, uid: register!)
                }
            }else {
                //mostrar erro de cadastro
            }
        }).disposed(by: disposedBag)
    }
    
}
protocol SignupRoutes {
    func makeHomeViewController()
}
