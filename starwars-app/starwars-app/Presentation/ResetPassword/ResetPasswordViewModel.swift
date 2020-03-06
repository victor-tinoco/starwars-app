//
//  ResetPasswordViewModel.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public protocol ResetPasswordViewModelContract {
    var resetResponse: Driver<Bool?>{ get }
    func goReset(email: String)
}

public class ResetViewModel: ResetPasswordViewModelContract {

    private let resetRelay: BehaviorRelay<Bool?> =
        BehaviorRelay(value: nil)
    public var resetResponse: Driver<Bool?> { return
        resetRelay.asDriver() }
    
    let disposeBag = DisposeBag()
    var usecase: ResetPasswordUseCase
    
    public func goReset(email: String) {
        usecase.goReset(email: email).subscribe(onSuccess: { (reset) in
            self.resetRelay.accept(reset)
        }).disposed(by: disposeBag)
    }

    init(usecase: ResetPasswordUseCase) {
        self.usecase = usecase
        
    }
    

}
