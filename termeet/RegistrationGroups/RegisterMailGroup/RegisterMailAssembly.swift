//
//  RegisterMailAssembly.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RegisterMailAssembly {
    static func build() -> UIViewController {
        let presenter = RegisterMailPresenter()
        let worker = RegisterMailWorker()
        let interactor = RegisterMailInteractor(presenter: presenter, worker: worker)
        let router = RegisterMailRouter(dataStore: interactor)
        let viewController = RegisterMailViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
