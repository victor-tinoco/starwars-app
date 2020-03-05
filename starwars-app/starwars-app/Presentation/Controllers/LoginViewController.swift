//
//  LoginViewController.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    var delegate: LoginViewControllerDelegate?
    
    var viewModel: LoginViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    
    }
    
    public class func create(delegate: LoginViewControllerDelegate, viewModel: LoginViewModel) -> LoginViewController {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        view.delegate = delegate
        view.viewModel = viewModel
        return view
        
    }
    
    
    @IBAction func loginButton(_ sender: Any) {
        viewModel.login.drive(onNext: { (login) in
            <#code#>
        })
        if let email = emailTextField.text, let password = passwordTextField.text, !password.isEmpty, !email.isEmpty
          
        {
            
            viewModel.goLogin(email: email, password: password)
           
            
            let vc = self.delegate?.didTouchButtonLogin()
            vc?.modalPresentationStyle = .fullScreen
            self.present(vc!, animated: true, completion: nil)
            
//            print("Usuário logado")
            
        } 
    }
    
}

protocol LoginViewControllerDelegate {
    func didTouchButtonLogin() -> UIViewController
}

 
