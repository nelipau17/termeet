//
//  RegisterInfoRouter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterInfoRouter: RegisterInfoRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: RegisterInfoDataStore

    init(dataStore: RegisterInfoDataStore) {
        self.dataStore = dataStore
    }
}

private extension RegisterInfoRouter { }
