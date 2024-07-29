//
//  RegisterRouter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterRouter: RegisterRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: RegisterDataStore

    init(dataStore: RegisterDataStore) {
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
}

private extension RegisterRouter { }
