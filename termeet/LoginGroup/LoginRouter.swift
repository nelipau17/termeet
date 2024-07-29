//
//  LoginRouter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoginRouter: LoginRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: LoginDataStore

    init(dataStore: LoginDataStore) {
        self.dataStore = dataStore
    }
    //MARK: - FUNC's
    func emailIsValid(email: String) -> Bool {
        let pattern = "[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        guard email.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
    
    func passwordIsValid(password: String) -> Bool {
        let pattern = "^(?=.+[A-Z])(?=.+[0-9])(?=.+[.,?!():;]).{8,}$"
        
        guard password.range(of: pattern, options: .regularExpression) != nil else {
            return false
        }
        return true
    }
}

private extension LoginRouter { }
