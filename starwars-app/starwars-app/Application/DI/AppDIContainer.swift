//
//  AppDIContainer.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 04/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class AppDIContainer {
    func makeDetailsViewController() -> UIViewController {
        return PeopleDetailsViewController.instantiate(viewModel: PeopleDetailsViewModel(people: People(name: "", height: "", mass: "", faction: "", hair_color: "", skin_color: "", eye_color: "", birth_year: "", gender: "")))!
    }
}
