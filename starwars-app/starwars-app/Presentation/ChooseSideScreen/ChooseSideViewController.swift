//
//  ChooseSideViewController.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit

class ChooseSideViewController: UIViewController {
    
    var viewModel: PeopleListViewModelProtocol?
    
    public class func instantiate(viewModel: PeopleListViewModel) -> ChooseSideViewController {
        let storyboard = UIStoryboard(name: "ChooseSideViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ChooseSideViewController") as! ChooseSideViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}
