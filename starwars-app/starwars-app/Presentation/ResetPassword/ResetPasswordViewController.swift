//
//  ResetPasswordViewController.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import FirebaseAuth

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    static func instantiate() -> ResetPasswordViewController {
                 let storyboard = UIStoryboard(name: "ResetPasswordViewController", bundle: nil)
                 let view = storyboard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
                 return view
             }
    
    @IBAction func resetButton(_ sender: Any) {
        if let email = emailTextField.text{
            self.sendPasswordReset(withEmail: email)
        }
        
        
    }
        func sendPasswordReset(withEmail email: String, _ callback: ((Error?) -> ())? = nil){
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error {
                    print("deu  ruim")
                } else {
                    print("deu bom")
                }
            }
        }
}
