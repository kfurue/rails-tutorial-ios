//
//  UserViewModel.swift
//  SampleApp
//
//  Created by Kazuhiro Furue on 2017/09/06.
//  Copyright © 2017年 Kazuhiro Furue. All rights reserved.
//

import Foundation
import RxSwift

final class UserViewModel {
    let users: Variable<[User]> = Variable([User]())
    private var disposeBag = DisposeBag()

    func fetchUsers() {

        disposeBag = DisposeBag()
        UsersAPI.getApiV1Users()
        .subscribe(onNext: { [unowned self] users in
            self.users.value += users
        })
        .addDisposableTo(disposeBag)
    }
}
