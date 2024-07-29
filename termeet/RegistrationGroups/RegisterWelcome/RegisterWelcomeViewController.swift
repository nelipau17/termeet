//
//  RegisterWelcomeViewController.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterWelcomeViewController: UIViewController, RegisterWelcomeDisplayLogic {
    
    let leadingInset: CGFloat = 16
    
    private let interactor: RegisterWelcomeBusinessLogic
    private let router: RegisterWelcomeRoutingLogic
    
    var logo = UIImage(named: "logoBlack")
    //MARK: - ELEMENTS
    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 28
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var logoImageView: UIImageView = { //mainStackView
        let imageView = UIImageView(image: logo)
        imageView.frame = CGRect(x: 8, y: 8, width: 42.13, height: 58.0)
        return imageView
    }()

    private lazy var welcomeLabel: UILabel = { //mainStackView
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 4
        label.text = "Добро пожаловать\nв termeet"
        label.textColor = AppColors.termeetMain
        return label
    }()

    //MARK: - SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        view.backgroundColor = .white
        setupLayout()
    }

    private func setupLayout() {
        setupMainStackView()
    }

    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(logoImageView)
        
        mainStackView.addArrangedSubview(welcomeLabel)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    //MARK: - INIT
    init(interactor: RegisterWelcomeBusinessLogic, router: RegisterWelcomeRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - RegisterWelcomeDisplayLogic

    func displayInitForm(_ viewModel: RegisterWelcome.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(RegisterWelcome.InitForm.Request())
    }
}
