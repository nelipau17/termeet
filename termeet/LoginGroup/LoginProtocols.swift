//
//  LoginProtocols.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol LoginDataStore {}

protocol LoginBusinessLogic {
    func requestInitForm(_ request: Login.InitForm.Request)
}

protocol LoginWorkerLogic {}

protocol LoginPresentationLogic {
    func presentInitForm(_ response: Login.InitForm.Response)
}

protocol LoginDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: Login.InitForm.ViewModel)
}

protocol LoginRoutingLogic {
    func emailIsValid(email: String) -> Bool
    func passwordIsValid(password: String) -> Bool
}
