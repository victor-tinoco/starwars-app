//
//  PeopleDetailsViewController.swift
//  starwars-app
//
//  Created by Victor Martins Tinoco - VTN on 05/03/20.
//  Copyright © 2020 tinoco. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class PeopleDetailsViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            self.nameLabel.text = _viewModel?.name
        }
    }
    @IBOutlet weak var factionLabel: UILabel! {
        didSet {
            self.factionLabel.text = _viewModel?.faction
        }
    }
    @IBOutlet weak var shareButton: UIButton!
    
    private var _viewModel: PeopleDetailsViewModelContract?
    
    var disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bind()
    }
    
    func bind() {
        shareButton.rx.tap.bind {
            self.shareImage()
        }.disposed(by: disposeBag)
    }
    
    static func instantiate(viewModel: PeopleDetailsViewModelContract) -> PeopleDetailsViewController? {
        let sb = UIStoryboard(name: "PeopleDetails", bundle: Bundle(for: PeopleDetailsViewController.self))
        guard let vc = sb.instantiateViewController(withIdentifier: PeopleDetailsViewController.storyboardIdentifier) as? PeopleDetailsViewController else { return nil }
        vc._viewModel = viewModel
        return vc
    }
}

extension UIViewController {
    func shareImage() {
        let bounds = UIScreen.main.bounds
        UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
        self.view.drawHierarchy(in: bounds, afterScreenUpdates: false)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}
