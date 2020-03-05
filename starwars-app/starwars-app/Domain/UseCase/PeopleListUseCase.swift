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
    
    var peopleResponse: [People] = []
    
    init(peopleListRepo: PeopleListRepository) {
        self.peopleListRepo = peopleListRepo
    }
    
    func getLightSidePeopleList() -> Single<[People]> {
        let filtered = peopleResponse.filter { $0.faction.contains("RESISTENCE") }
        return peopleListRepo.getPeopleList(people: filtered)
    }
    
    func getDarkSidePeopleList() -> Single<[People]> {
        let filtered = peopleResponse.filter { $0.faction == "EMPIRE" }
        return peopleListRepo.getPeopleList(people: filtered)
    }
}
