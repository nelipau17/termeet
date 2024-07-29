//
//  RegisterViewController.swift
//  termeet
//
//  Created by Polina Popova on 23/07/2024.
//  Copyright (c) 2024 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

final class RegisterViewController: UIViewController, RegisterDisplayLogic {
    
    private let leadingInset: CGFloat = 16
    
    private let interactor: RegisterBusinessLogic
    private let router: RegisterRoutingLogic

    //MARK: - ENUMs
    enum EmailTFStrings: String {
            case placeholder = "Введите почту"
            case labelName = "Почта"
            case invalidText = "Почта некорректна"
    }
    //MARK: - ELEMENTS
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .left
        label.text = "Регистрация"
        return label
    }()
    
    private lazy var emailTextField: ValidatableTextField = {
        let textField = ValidatableTextField()
        textField.setup(title: EmailTFStrings.labelName.rawValue, placeholder: EmailTFStrings.placeholder.rawValue, invalidTitle: EmailTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()
    
    private lazy var bottomStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var loginButton: UIButton = { //bottomStackView
        let button = UIButton()
        button.setTitle("Подтвердить почту", for: .normal)
        button.backgroundColor = AppColors.termeetStroke
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(moveToRegisterMailScene), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var registerLabel: UILabel = { //bottomStackView
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
    
    @objc func moveToRegisterMailScene() {
        guard let email = emailTextField.text else { return }
        emailTextField.isValid = router.emailIsValid(email: email)
        
        guard router.emailIsValid(email: email) else {return}
        
        let registerMailVC = RegisterMailAssembly.build()
        registerMailVC.modalPresentationStyle = .fullScreen
        self.present(registerMailVC, animated: true)
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
            setupMailField()
            setupBottomStackView()
        }
        
        private func setupLabel() {
            view.addSubview(titleLabel)
            titleLabel.translatesAutoresizingMaskIntoConstraints = false
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        }
        
        private func setupMailField() {
            view.addSubview(emailTextField)
            emailTextField.translatesAutoresizingMaskIntoConstraints = false
            
            emailTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 61).isActive = true
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        }
        
        private func setupBottomStackView() {
            view.addSubview(bottomStackView)
            bottomStackView.translatesAutoresizingMaskIntoConstraints = false
            bottomStackView.addArrangedSubview(registerLabel)
            setupButton()
            
            bottomStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            bottomStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -43).isActive = true
        }
        
        private func setupButton() {
            view.addSubview(loginButton)
            loginButton.translatesAutoresizingMaskIntoConstraints = false
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
            loginButton.bottomAnchor.constraint(equalTo: bottomStackView.topAnchor, constant: -20).isActive = true
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            loginButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
        }

    //MARK: - INIT
    init(interactor: RegisterBusinessLogic, router: RegisterRoutingLogic) {
        self.interactor = interactor
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - RegisterDisplayLogic

    func displayInitForm(_ viewModel: Register.InitForm.ViewModel) {}

    // MARK: - Private

    private func initForm() {
        interactor.requestInitForm(Register.InitForm.Request())
    }
}
