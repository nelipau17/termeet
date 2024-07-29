//
//  RegisterWelcomeAssembly.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RegisterWelcomeAssembly {
    static func build() -> UIViewController {
        let presenter = RegisterWelcomePresenter()
        let worker = RegisterWelcomeWorker()
        let interactor = RegisterWelcomeInteractor(presenter: presenter, worker: worker)
        let router = RegisterWelcomeRouter(dataStore: interactor)
        let viewController = RegisterWelcomeViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
