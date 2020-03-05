//
//  PeopleListViewModel.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol PeopleListViewModelProtocol: class {
    var peopleList: Driver<[People]> { get }
    func showPeoplelist(people: [People])
}
