//
//  confirmPassword.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 10/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ConfirmPasswordViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var btnRegister: UIButton!
    
    let disposed = DisposeBag()
    var viewModelContract: ConformPasswordContract!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        
    }
    
    static func instantiate(viewModel: ConformPasswordContract) -> ConfirmPasswordViewController {
        let storyboard = UIStoryboard(name: "ConfirmPassword", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ConfirmPasswordViewController") as! ConfirmPasswordViewController
        view.viewModelContract = viewModel
        return view
    }
    
    func bind(){
        btnRegister.rx.tap.bind {
            if let password = self.passwordTextField.text {
                self.viewModelContract.makeRegister(password: password)
            }
                self.viewModelContract.storeRegister.drive(onNext: { (register) in
                    if register == true {
                        print("SUCESSO")
                    }else {
                        print("ERRO")
                    }
                })
            }.disposed(by: disposed)
        }
    }


protocol ConfirmPassRoutes {
    func makeHomeViewController()
    
}

