//
//  RegisterInfoAssembly.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

enum RegisterInfoAssembly {
    static func build() -> UIViewController {
        let presenter = RegisterInfoPresenter()
        let worker = RegisterInfoWorker()
        let interactor = RegisterInfoInteractor(presenter: presenter, worker: worker)
        let router = RegisterInfoRouter(dataStore: interactor)
        let viewController = RegisterInfoViewController(interactor: interactor, router: router)

        presenter.view = viewController
        router.viewController = viewController

        return viewController
    }
}
