//
//  ResetPasswordUseCase.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

public class ResetPasswordUseCase {
    let resetRepo: ResetPasswordRepository
    
    init(resetRepository: ResetPasswordRepository) {
        self.resetRepo = resetRepository
    }
    public func goReset(email: String) -> Single<Bool> {
        return resetRepo.getReset(email: email)
    }
    
}

