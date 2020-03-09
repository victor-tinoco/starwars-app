//
//  ChooseSideViewController.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 06/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class ChooseSideViewController: UIViewController {
    
    var viewModel: ChooseSideViewModelProtocol?
    var routes: ChooseDIContainerProtocol?
    
    var disposeBag = DisposeBag()
    
    public class func instantiate(viewModel: ChooseSideViewModel, routes: ChooseDIContainerProtocol) -> ChooseSideViewController {
        let storyboard = UIStoryboard(name: "ChooseSideViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "ChooseSideViewController") as! ChooseSideViewController
        view.viewModel = viewModel
        view.routes = routes
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }

    func bind() {
        viewModel?.peopleList.drive(onNext: { (peoples) in
            guard let people = peoples else { return }
            let vc = self.routes?.callListScreen(people: people)
            vc?.modalPresentationStyle = .popover
            self.present(vc!, animated: true, completion: nil)
        }).disposed(by: disposeBag)
    }
    
    @IBAction func lightSideButton(_ sender: Any) {
        viewModel?.getLightSidePeopleList()
    }

    @IBAction func darkSideButton(_ sender: Any) {
        viewModel?.getDarkSidePeopleList()
    }
}
