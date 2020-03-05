//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
 
    let signUpDI = SignUpDIContainer()
    
    
    func callSignUp() -> SignUpViewController {
        return signUpDI.makePeopleListViewController(appDI: self)
    }

}
