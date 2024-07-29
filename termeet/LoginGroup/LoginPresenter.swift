//
//  LoginPresenter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class LoginPresenter: LoginPresentationLogic {
    weak var view: LoginDisplayLogic?

    func presentInitForm(_ response: Login.InitForm.Response) {
        view?.displayInitForm(Login.InitForm.ViewModel())
    }
}
