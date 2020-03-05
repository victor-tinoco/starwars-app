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
    var peopleList: Driver<[People]?> { get }
    func showLightSidePeopleList()
}

class PeopleListViewModel: PeopleListViewModelProtocol {

    
    private let peopleListRelay: BehaviorRelay<[People]?> = BehaviorRelay(value: nil)
    
    var peopleList: Driver<[People]?> { peopleListRelay.asDriver()}
    var peopleListUseCase: PeopleListUseCase
    var disposeBag = DisposeBag()
    
    init(peopleListUseCase: PeopleListUseCase) {
        self.peopleListUseCase = peopleListUseCase
    }
    
    func showLightSidePeopleList() {
        peopleListUseCase.getLightSidePeopleList().subscribe(onSuccess: { (peopleList) in
            self.peopleListRelay.accept(peopleList)
            }).disposed(by: disposeBag)
    }
    
    
}
