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
    let appDI = AppDIContainer()

    static func instantiate(viewModel: SignUpViewModel) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        view.viewModel = viewModel
        return view
    }
   
    @IBAction func completedRegister() {
        
        
        if let email = emailTextField.text, let password = passwordTextField.text {
            viewModel.finishRegister.drive(onNext: { (register) in
                if register == true {
                    self.viewModel.makeRegister(email: email, password: password)
                    let vc = self.appDI.callSignUp()
                    vc.modalPresentationStyle = .fullScreen

                    self.present(vc, animated: true, completion: nil)
                    
                
                }else {
                    self.viewModel.makeRegister(email: email, password: password)
                }
                }).disposed(by: disposedBag)
    
        }
    }
}
