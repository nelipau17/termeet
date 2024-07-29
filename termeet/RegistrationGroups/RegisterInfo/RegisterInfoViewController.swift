//
//  RegisterInfoViewController.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterInfoViewController: UIViewController, RegisterInfoDisplayLogic {
    
    private let leadingInset: CGFloat = 16
    
    private let interactor: RegisterInfoBusinessLogic
    private let router: RegisterInfoRoutingLogic

    //MARK: - ENUMs
    enum NameTFStrings: String {
            case placeholder = "Имя"
            case labelName = "Введите имя"
            case invalidText = ""
    }
        
    enum PasswordTFStrings: String {
            case placeholder = "Введите пароль"
            case labelName = "Пароль"
            case invalidText = "Некорректный пароль. Пароль должен содержать не менее 8 символов и состоять из цифр и латинских букв"
    }

    enum PasswordAgainTFStrings: String {
            case placeholder = "Введите пароль"
            case labelName = "Пароль"
            case invalidText = "Некорректный пароль. Пароль должен содержать не менее 8 символов и состоять из цифр и латинских букв"
    }
    //MARK: - ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .left
        label.text = "Регистрация"
        return label
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 24
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var insideStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var nameTextField: ValidatableTextField = { //mainStackView
        let textField = ValidatableTextField()
        textField.setup(title: NameTFStrings.labelName.rawValue, placeholder: NameTFStrings.placeholder.rawValue, invalidTitle: NameTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()

    private lazy var passwordTextField: ValidatableTextField = { //mainStackView //insideStackView
        let textField = ValidatableTextField()
        textField.setup(title: PasswordTFStrings.labelName.rawValue, placeholder: PasswordTFStrings.placeholder.rawValue, invalidTitle: PasswordTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()

    private lazy var passwordAgainTextField: ValidatableTextField = { //mainStackView
        let textField = ValidatableTextField()
        textField.setup(title: PasswordAgainTFStrings.labelName.rawValue, placeholder: PasswordAgainTFStrings.placeholder.rawValue, invalidTitle: PasswordAgainTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()

    private lazy var textLabel: UILabel = { //mainStackView //insideStackView
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textAlignment = .left
        label.text = "Пароль должен содержать не менее 8 символов и состоять из цифр и латинских букв"
        label.textColor = AppColors.termeetGrey
        label.numberOfLines = 10
        return label
    }()

    private lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.backgroundColor = AppColors.termeetStroke
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(moveToWelcomeScene), for: .touchUpInside)
        
        return button
    }()

    private lazy var loginLabel: UILabel = { //bottomStackView
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Уже есть аккаунт?"
        label.textColor = AppColors.termeetBTN
        label.textAlignment = .center
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToLoginScene))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    //MARK: - MOVE
    @objc func moveToWelcomeScene() {
        let welcomeVC = RegisterWelcomeAssembly.build()
        welcomeVC.modalPresentationStyle = .fullScreen
        self.present(welcomeVC, animated: true)
    }

    @objc func moveToLoginScene() {
        let loginVC = LoginAssembly.build()
        loginVC.modalPresentationStyle = .fullScreen
        self.present(loginVC, animated: true)
    }
    //MARK: - SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        initForm()
        view.backgroundColor = .white
        setupLayout()
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }

    private func setupLayout() {
        setupLabel()
        setupMainStackView()
        setupBottomStackView()
    }

    private func setupLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }

    private func setupInsideStackView() {
        view.addSubview(insideStackView)
        insideStackView.translatesAutoresizingMaskIntoConstraints = false
        insideStackView.addArrangedSubview(passwordTextField)
        insideStackView.addArrangedSubview(textLabel)
    }

    private func setupMainStackView() {
        setupInsideStackView()
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(nameTextField)
        mainStackView.addArrangedSubview(insideStackView)
        mainStackView.addArrangedSubview(passwordAgainTextField)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 61).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }

    private func setupBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.addArrangedSubview(loginLabel)
        setupButton()
        
        bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -43).isActive = true
    }

    private func setupButton() {
        view.addSubview(registerButton)
        registerButton.translatesAutoresizingMaskIntoConstraints = false
        registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        registerButton.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: -20).isActive = true
        registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }

    //MARK: - INIT
    init(interactor: RegisterInfoBusinessLogic, router: RegisterInfoRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - RegisterInfoDisplayLogic
    
    func displayInitForm(_ viewModel: RegisterInfo.InitForm.ViewModel) {}

    // MARK: - Private
    private func initForm() {
        interactor.requestInitForm(RegisterInfo.InitForm.Request())
    }
}
