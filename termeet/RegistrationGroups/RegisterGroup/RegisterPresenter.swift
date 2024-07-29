//
//  RegisterPresenter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterPresenter: RegisterPresentationLogic {
    weak var view: RegisterDisplayLogic?

    func presentInitForm(_ response: Register.InitForm.Response) {
        view?.displayInitForm(Register.InitForm.ViewModel())
    }
}
