//
//  RegisterWelcomeInteractor.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class RegisterWelcomeInteractor: RegisterWelcomeBusinessLogic, RegisterWelcomeDataStore {
    private let presenter: RegisterWelcomePresentationLogic
    private let worker: RegisterWelcomeWorkerLogic

    init(
        presenter: RegisterWelcomePresentationLogic,
        worker: RegisterWelcomeWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: RegisterWelcome.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(RegisterWelcome.InitForm.Response())
        }
    }
}
