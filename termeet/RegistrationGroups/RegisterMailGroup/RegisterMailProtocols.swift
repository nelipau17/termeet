//
//  RegisterMailProtocols.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol RegisterMailDataStore {}

protocol RegisterMailBusinessLogic {
    func requestInitForm(_ request: RegisterMail.InitForm.Request)
}

protocol RegisterMailWorkerLogic {}

protocol RegisterMailPresentationLogic {
    func presentInitForm(_ response: RegisterMail.InitForm.Response)
}

protocol RegisterMailDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: RegisterMail.InitForm.ViewModel)
}

protocol RegisterMailRoutingLogic {}
