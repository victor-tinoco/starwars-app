//
//  ResetPasswordViewController.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import FirebaseAuth
import RxSwift
import RxCocoa

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    var viewModel: ResetPasswordViewModelContract!
    var dispose = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        close()
      sendButton.layer.borderColor = (UIColor(named: "yellowbutton")?.cgColor as! CGColor)
        sendButton.layer.cornerRadius = 21
        
       emailTextField.attributedPlaceholder = NSAttributedString(string:"E-MAIL", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "placeholder")])
       emailTextField.layer.borderColor = (UIColor(named: "alert")?.cgColor )

        bind()
    }
    
    static func instantiate(viewModel: ResetViewModel) -> ResetPasswordViewController {
        let storyboard = UIStoryboard(name: "ResetPasswordViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ResetPasswordViewController") as! ResetPasswordViewController
        view.viewModel = viewModel
        return view
    }
    
    @IBAction func resetButton(_ sender: Any) {
        if let email = emailTextField.text, !email.isEmpty {
            self.viewModel.goReset(email: email)
            self.dismiss(animated: true, completion: nil)
        }
      
    }
        func bind(){
            self.viewModel.resetResponse.drive(onNext: { (reset) in
                if reset == true {
                  
                }else{
                    print("n foi :(")
                }
                
            }).disposed(by: dispose)
            
            
    }
    
    func close() {
             closeButton.rx.tap.bind {
                 self.dismiss(animated: true, completion: nil)
        }.disposed(by: dispose)
    }
}
