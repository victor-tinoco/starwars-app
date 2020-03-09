//
//  PeopleDetailsViewModel.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import Foundation

protocol PeopleDetailsViewModelContract {
    var name: String { get }
    var height: String { get }
    var mass: String { get }
    var hairColor: String { get }
    var skinColor: String { get }
    var eyeColor: String { get }
    var birthYear: String { get }
    var gender: String { get }
    var faction: String { get }
}

class PeopleDetailsViewModel: PeopleDetailsViewModelContract {
    private var _people: People
    
    init(people: People) {
        _people = people
    }
    
    var name: String {
        return _people.name
    }
    
    var faction: String {
        return _people.faction
    }
    
    var height: String {
        return _people.height
    }
    
    var mass: String {
        return _people.mass
    }
    
    var hairColor: String {
        return _people.hair_color
    }
    
    var skinColor: String {
        return _people.skin_color
    }
    
    var eyeColor: String {
        return _people.eye_color
    }
    
    var birthYear: String {
        return _people.birth_year
    }
    
    var gender: String {
        return _people.gender
    }
}
