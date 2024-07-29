//
//  RegisterWelcomePresenter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterWelcomePresenter: RegisterWelcomePresentationLogic {
    weak var view: RegisterWelcomeDisplayLogic?

    func presentInitForm(_ response: RegisterWelcome.InitForm.Response) {
        view?.displayInitForm(RegisterWelcome.InitForm.ViewModel())
    }
}
