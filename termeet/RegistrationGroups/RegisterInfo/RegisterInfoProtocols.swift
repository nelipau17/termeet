//
//  RegisterInfoProtocols.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol RegisterInfoDataStore {}

protocol RegisterInfoBusinessLogic {
    func requestInitForm(_ request: RegisterInfo.InitForm.Request)
}

protocol RegisterInfoWorkerLogic {}

protocol RegisterInfoPresentationLogic {
    func presentInitForm(_ response: RegisterInfo.InitForm.Response)
}

protocol RegisterInfoDisplayLogic: AnyObject {
    func displayInitForm(_ viewModel: RegisterInfo.InitForm.ViewModel)
}

protocol RegisterInfoRoutingLogic {}
