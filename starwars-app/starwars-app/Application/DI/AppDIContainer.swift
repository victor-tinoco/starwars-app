//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
    func showChooseSideViewController() -> ChooseSideViewController {
        return makeChooseSideDI.makeChooseSideViewController()
    }
    var makeChooseSideDI: ChooseDIContainer {
        return ChooseDIContainer()
    }
}
