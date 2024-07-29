//
//  RegisterWelcomeProtocols.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol RegisterWelcomeDataStore {}

protocol RegisterWelcomeBusinessLogic {
    func requestInitForm(_ request: RegisterWelcome.InitForm.Request)
}

protocol RegisterWelcomeWorkerLogic {}

protocol RegisterWelcomePresentationLogic {
    func presentInitForm(_ response: RegisterWelcome.InitForm.Response)
}

protocol RegisterWelcomeDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: RegisterWelcome.InitForm.ViewModel)
}

protocol RegisterWelcomeRoutingLogic {}
