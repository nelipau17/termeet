//
//  LoginAssembly.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum LoginAssembly {
    static func build() -> UIViewController {
        let presenter = LoginPresenter()
        let worker = LoginWorker()
        let interactor = LoginInteractor(presenter: presenter, worker: worker)
        let router = LoginRouter(dataStore: interactor)
        let viewController = LoginViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
