//
//  RegisterInfoInteractor.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//
import Foundation

final class RegisterInfoInteractor: RegisterInfoBusinessLogic, RegisterInfoDataStore {
    private let presenter: RegisterInfoPresentationLogic
    private let worker: RegisterInfoWorkerLogic

    init(
        presenter: RegisterInfoPresentationLogic,
        worker: RegisterInfoWorkerLogic
    ) {
        self.presenter = presenter
        self.worker = worker
    }

    func requestInitForm(_ request: RegisterInfo.InitForm.Request) {
        DispatchQueue.main.async {
            self.presenter.presentInitForm(RegisterInfo.InitForm.Response())
        }
    }
}
