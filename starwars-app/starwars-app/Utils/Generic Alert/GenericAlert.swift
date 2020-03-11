//
//  GenericAlert.swift
//  starwars-app
//
//  Created by Gabriel dos Santos Nascimento - GNS on 11/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

protocol GenericAlertContract {
    func genericAlert(title: String, btnTitle: String, message: String)
}

class GenericAlert: UIAlertController {
    
    func genericAlert(title: String, btnTitle: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: btnTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
