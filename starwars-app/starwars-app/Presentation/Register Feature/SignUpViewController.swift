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
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var birthdayTextField: UITextField!
    @IBOutlet weak var emailBorder: UITextField!
    @IBOutlet weak var nameBorder: UITextField!
    @IBOutlet weak var birthdayBorder: UITextField!
    
    @IBOutlet weak var btnConfirm: UIButton!
    
    var viewModel: SignUpViewModel!
    let disposedBag = DisposeBag()
    let appDI = AppDIContainer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
        emailBorder.layer.cornerRadius = 11
        nameBorder.layer.cornerRadius = 11
        birthdayTextField.layer.cornerRadius = 11
        emailBorder.layer.borderWidth = 1
        nameBorder.layer.borderWidth = 1
        birthdayBorder.layer.borderWidth = 1
        emailBorder.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        nameBorder.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        birthdayBorder.layer.borderColor = UIColor(named: "borderColor")?.cgColor
        
        btnConfirm.layer.cornerRadius = 22
        btnConfirm.layer.borderWidth = 1
        btnConfirm.layer.borderColor = UIColor(named: "btnBorderColor")?.cgColor
    }
    
    static func instantiate(viewModel: SignUpViewModel) -> SignUpViewController {
        let storyboard = UIStoryboard(name: "SignUp", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        view.viewModel = viewModel
        return view
    }
    
    func bind() {
        btnConfirm.rx.tap.bind {
            if let email = self.emailTextField.text, let name = self.nameTextField.text, let birthday = self.birthdayTextField.text {
                
                let firstRegister = FirstRegister(name: name, birthday: birthday, email: email)
                let vc = self.appDI.makeConfirmPassViewController(firstRegister:firstRegister)
                self.present(vc, animated: true, completion: nil)
            }
        }.disposed(by: disposedBag)
    }    
}
protocol SignupRoutes {
    func makeConfirmPassViewController(vm: SignUpViewModel) -> SignUpViewController
}
