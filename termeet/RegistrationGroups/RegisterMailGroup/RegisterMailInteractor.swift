//
//  RegisterMailInteractor.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class RegisterMailInteractor: RegisterMailBusinessLogic, RegisterMailDataStore {
    private let presenter: RegisterMailPresentationLogic
    private let worker: RegisterMailWorkerLogic

    init(
        presenter: RegisterMailPresentationLogic,
        worker: RegisterMailWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: RegisterMail.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(RegisterMail.InitForm.Response())
        }
    }
}
