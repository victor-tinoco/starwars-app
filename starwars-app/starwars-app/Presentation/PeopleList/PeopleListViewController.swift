//
//  PeopleListViewController.swift
//  starwars-app
//
//  Created by Miguel Barone - MBA on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleListViewController: UIViewController {
    @IBOutlet weak var peopleTableView: UITableView!
    
    var viewModel: PeopleListViewModel!
    var disposeBag = DisposeBag()
    
    public class func instantiate(viewModel: PeopleListViewModel) -> PeopleListViewController {
        let storyboard = UIStoryboard(name: "PeopleListViewController", bundle: nil)
        let view = storyboard.instantiateViewController(withIdentifier: "PeopleListViewController") as! PeopleListViewController
        view.viewModel = viewModel
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peopleTableView.register(UINib(nibName: "PeopleTableViewCell", bundle: nil), forCellReuseIdentifier: "PeopleTableViewCell")
        bind()
    }

    private func bind() {
        viewModel.peopleList.drive(peopleTableView.rx.items(cellIdentifier: "PeopleTableViewCell", cellType: PeopleTableViewCell.self)) { index, model, cell in
            cell.configure(model: model)
        }.disposed(by: disposeBag)
    }

}
