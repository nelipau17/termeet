//
//  RegisterMailRouter.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterMailRouter: RegisterMailRoutingLogic {
    weak var viewController: UIViewController?
    private let dataStore: RegisterMailDataStore

    init(dataStore: RegisterMailDataStore) {
        self.dataStore = dataStore
    }
}

private extension RegisterMailRouter { }
