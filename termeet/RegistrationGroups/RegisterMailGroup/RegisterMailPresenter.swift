//
//  RegisterMailPresenter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

final class RegisterMailPresenter: RegisterMailPresentationLogic {
    weak var view: RegisterMailDisplayLogic?

    func presentInitForm(_ response: RegisterMail.InitForm.Response) {
        view?.displayInitForm(RegisterMail.InitForm.ViewModel())
    }
}
