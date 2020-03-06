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

class PeopleListViewModel {
    private var peopleListRelay: BehaviorRelay<[People]?> = BehaviorRelay(value: nil)
    
    var peopleList: Driver<[People]?> { peopleListRelay.asDriver() }

    init(peopleList: [People]) {
        self.peopleListRelay.accept(peopleList)
    }
}
