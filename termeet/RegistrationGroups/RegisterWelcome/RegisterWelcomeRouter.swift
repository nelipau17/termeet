//
//  RegisterWelcomeRouter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterWelcomeRouter: RegisterWelcomeRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: RegisterWelcomeDataStore

    init(dataStore: RegisterWelcomeDataStore) {
        self.dataStore = dataStore
    }
}

private extension RegisterWelcomeRouter { }
