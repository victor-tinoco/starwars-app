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
    
    @IBOutlet weak var btnConfirm: UIButton!
    var viewModel: SignUpContract!
    let disposedBag = DisposeBag()
    let appDI = AppDIContainer()

    static func instantiate(viewModel: SignUpContract) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        view.viewModel = viewModel
        return view
    }
    func bind(){
        btnConfirm.rx.tap.bind {
            if let email = self.emailTextField.text, let password = self.passwordTextField.text {
                self.viewModel.finishRegister.drive(onNext: { (register) in
                        if register == true {
                            self.viewModel.makeRegister(email: email, password: password)
                        }else {
                            self.viewModel.makeRegister(email: email, password: password)
                        }
                    }).disposed(by: self.disposedBag)
            
                }
        }.disposed(by: disposedBag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
}
protocol SignupRoutes {
    func makeHomeViewController()
}
