//
//  PeopleListUseCase.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift

class PeopleListUseCase {
    
    var peopleListRepo: PeopleListRepository
    
    init(peopleListRepo: PeopleListRepository) {
        self.peopleListRepo = peopleListRepo
    }
    
    func getPeopleList() -> Single<[People]> {
       return peopleListRepo.getPeopleList()
    }
}
