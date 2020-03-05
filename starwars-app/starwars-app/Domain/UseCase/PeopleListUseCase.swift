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
        return peopleListRepo.getPeopleList().map { (people) in
            people.filter { (peoples) in
                peoples.faction == "RESISTENCE"
            }
        }
    }
    
    func getDarkSidePeopleList() -> Single<[People]> {
        return peopleListRepo.getPeopleList().map { (people) in
            people.filter { (peoples) in
                peoples.faction == "EMPIRE"
            }
        }
    }
}
