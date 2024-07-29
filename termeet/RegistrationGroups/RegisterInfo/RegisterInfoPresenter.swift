//
//  RegisterInfoPresenter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterInfoPresenter: RegisterInfoPresentationLogic {
    weak var view: RegisterInfoDisplayLogic?

    func presentInitForm(_ response: RegisterInfo.InitForm.Response) {
        view?.displayInitForm(RegisterInfo.InitForm.ViewModel())
    }
}
