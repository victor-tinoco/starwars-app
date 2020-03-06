//
//  ResetPasswordRepository.swift
//  starwars-app
//
//  Created by Nina Dominique Thomé Bernardo - NBE on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation
import RxSwift

protocol ResetPasswordRepository {
    func getReset(email: String) -> Single<Bool>
}
