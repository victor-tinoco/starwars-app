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

protocol PeopleListViewModelContract {
    var peopleList: Driver<[People]> { get }
}

class PeopleListViewModel: PeopleListViewModelContract {
    private var peopleListRelay: BehaviorRelay<[People]> = BehaviorRelay(value: [])
    
    var peopleList: Driver<[People]> { peopleListRelay.asDriver() }

    init(peopleList: [People]) {
        self.peopleListRelay.accept(peopleList)
    }
}
