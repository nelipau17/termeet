//
//  RegisterProtocols.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol RegisterDataStore {}

protocol RegisterBusinessLogic {
    func requestInitForm(_ request: Register.InitForm.Request)
}

protocol RegisterWorkerLogic {}

protocol RegisterPresentationLogic {
    func presentInitForm(_ response: Register.InitForm.Response)
}

protocol RegisterDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Register.InitForm.ViewModel)
}

protocol RegisterRoutingLogic {
    func emailIsValid(email: String) -> Bool
}
