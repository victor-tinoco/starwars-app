//
//  PeopleListDIContainer.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

class PeopleListDIContainer {
    
    func makePeopleListViewController(people: [People]) -> PeopleListViewController {
        return PeopleListViewController.instantiate(viewModel: PeopleListViewModel(peopleList: people))
    }
}
