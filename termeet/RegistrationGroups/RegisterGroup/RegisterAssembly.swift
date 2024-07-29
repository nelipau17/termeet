//
//  RegisterAssembly.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RegisterAssembly {
    static func build() -> UIViewController {
        let presenter = RegisterPresenter()
        let worker = RegisterWorker()
        let interactor = RegisterInteractor(presenter: presenter, worker: worker)
        let router = RegisterRouter(dataStore: interactor)
        let viewController = RegisterViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
