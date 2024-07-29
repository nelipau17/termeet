//
//  RegisterInteractor.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class RegisterInteractor: RegisterBusinessLogic, RegisterDataStore {
    private let presenter: RegisterPresentationLogic
    private let worker: RegisterWorkerLogic

    init(
        presenter: RegisterPresentationLogic,
        worker: RegisterWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: Register.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(Register.InitForm.Response())
        }

    }
}
