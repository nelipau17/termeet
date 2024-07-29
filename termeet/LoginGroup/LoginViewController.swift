//
//  LoginViewController.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class LoginViewController: UIViewController, LoginDisplayLogic {
    
    private let leadingInset: CGFloat = 16
    
    private let interactor: LoginBusinessLogic
    private let router: LoginRoutingLogic

    //MARK: - ENUMs
    enum EmailTFStrings: String {
            case placeholder = "Введите почту"
            case labelName = "Почта"
            case invalidText = "Почта некорректна"
    }
        
    enum PasswordTFStrings: String {
            case placeholder = "Введите пароль"
            case labelName = "Пароль"
            case invalidText = "Неверный пароль"
    }
    //MARK: - ELEMENTS
    
    let passwordTextField: UITextField = { //passwordStackView
        let textField = UITextField()
        textField.placeholder = "Enter password"
        textField.isSecureTextEntry = true
        textField.borderStyle = .roundedRect
        textField.layer.cornerRadius = 5
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.gray.cgColor
        return textField
    }()

    private lazy var showPasswordButton: UIButton = { //passwordStackView
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        button.tintColor = AppColors.termeetGrey
        
        button.addTarget(self, action: #selector(showPasswordButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .H1Bold
        label.textAlignment = .left
        label.text = "Вход"
        return label
    }()

    private lazy var mainStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 32
        stackView.axis = .vertical
        return stackView
    }()

    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var passwordStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 12
        stackView.axis = .horizontal
        
        return stackView
    }()
    
    private lazy var emailTextField: ValidatableTextField = { //mainStackView
        let textField = ValidatableTextField()
        textField.setup(title: EmailTFStrings.labelName.rawValue, placeholder: EmailTFStrings.placeholder.rawValue, invalidTitle: EmailTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()
    
    private lazy var forgetLabel: UILabel = { // UNDER  -  mainStackView
        let label = UILabel()
        label.font = .mainRegular
        label.text = "Забыли пароль?"
        label.textColor = AppColors.termeetBTN
        label.textAlignment = .right
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToRecovery))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()

    private lazy var loginButton: UIButton = { //bottomStackView
        let button = UIButton()
        button.setTitle("Войти", for: .normal)
        button.backgroundColor = AppColors.termeetStroke
        button.titleLabel?.font = .mainRegular
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(moveToMainScene), for: .touchUpInside)
        
        return button
    }()

    private lazy var registerLabel: UILabel = { //bottomStackView
        let label = UILabel()
        label.font = .mainRegular
        label.text = "Еще нет аккаунта?"
        label.textColor = AppColors.termeetBTN
        label.textAlignment = .center
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(moveToRegister))
        label.addGestureRecognizer(tapGestureRecognizer)
        label.isUserInteractionEnabled = true
        
        return label
    }()
    //MARK: - MOVE
    
    @objc func moveToMainScene() {
        guard let email = emailTextField.text else { return }
        emailTextField.isValid = router.emailIsValid(email: email)
        
        guard router.emailIsValid(email: email) else {return}
        
        //let personalAreaVC = PersonalAreaAssembly.build()
        //personalAreaVC.modalPresentationStyle = .fullScreen
        //self.present(personalAreaVC, animated: true)
        }
    
    @objc func moveToRecovery() {
        //let recoveryVC = RecoveryAssembly.build()
        //recoveryVC.modalPresentationStyle = .fullScreen
        //self.present(recoveryVC, animated: true)
    }
    
    @objc func moveToRegister() {
        let registerVC = RegisterAssembly.build()
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    //MARK: - INIT
    init(interactor: LoginBusinessLogic, router: LoginRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - LoginDisplayLogic

    func displayInitForm(_ viewModel: Login.InitForm.ViewModel) {}
    
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
        setupForgetLabel()
        setupBottomStackView()
    }

    private func setupLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }

    private func setupMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.addArrangedSubview(emailTextField)
        setupPasswordStackView()
        mainStackView.addArrangedSubview(passwordStackView)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 41).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }
    
    private func setupForgetLabel() {
        view.addSubview(forgetLabel)
        forgetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        forgetLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -leadingInset).isActive = true
        forgetLabel.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 12).isActive = true
    }

    private func setupBottomStackView() {
        view.addSubview(bottomStackView)
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.addArrangedSubview(registerLabel)
        setupButton()
        
        bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -43).isActive = true
    }
    
    private func setupPasswordStackView() {
        passwordStackView.addArrangedSubview(passwordTextField)
        passwordStackView.addArrangedSubview(showPasswordButton)
    }

    private func setupButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: -20).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }

    // MARK: - Private 
    private func initForm() {
        interactor.requestInitForm(Login.InitForm.Request())
    }
    
    @objc func showPasswordButtonTapped() {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry

        if passwordTextField.isSecureTextEntry {
            showPasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        } else {
            showPasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        }
    }
}
