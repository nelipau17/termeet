//
//  LoginInteractor.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class LoginInteractor: LoginBusinessLogic, LoginDataStore {
    private let presenter: LoginPresentationLogic
    private let worker: LoginWorkerLogic

    init(
        presenter: LoginPresentationLogic,
        worker: LoginWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Login.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Login.InitForm.Response())
        }
    }
}
