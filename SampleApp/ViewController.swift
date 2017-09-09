//
//  ViewController.swift
//  SampleApp
//
//  Created by Kazuhiro Furue on 2017/08/20.
//  Copyright © 2017年 Kazuhiro Furue. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    fileprivate let viewModel = UserViewModel()
    private let disposeBag = DisposeBag()
    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        configureObserver()
        viewModel.fetchUsers()
    }

    private func configureObserver() {
        SampleAppClientAPI.customHeaders["Authorization"]
            = "Bearer 9fa9995a17c5849083890b3ee0ef5fbd3fe1b93036b16eefe1149ac34387cc0d"

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")

        viewModel.users.asDriver().drive(
            tableView.rx.items(cellIdentifier: "Cell"),
            curriedArgument: { _, user, cell in
                cell.textLabel?.text = user.name
        })
            .addDisposableTo(disposeBag)
    }

}
