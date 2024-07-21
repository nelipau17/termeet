//
//  ViewController.swift
//  termeet
//
//  Created by Polina Popova on 19/07/2024.
//

import UIKit

class LoginViewController: UIViewController {
    private let leadingInset: CGFloat = 16

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
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .heavy)
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
    
    private lazy var emailTextField: ValidatableTextField = { //mainStackView
        let textField = ValidatableTextField()
        textField.setup(title: EmailTFStrings.labelName.rawValue, placeholder: EmailTFStrings.placeholder.rawValue, invalidTitle: EmailTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()
    
    private lazy var passwordTextField: ValidatableTextField = { //mainStackView
        let textField = ValidatableTextField()
        textField.setup(title: PasswordTFStrings.labelName.rawValue, placeholder: PasswordTFStrings.placeholder.rawValue, invalidTitle: PasswordTFStrings.invalidText.rawValue, style: .dark)
        return textField
    }()
    
    private lazy var forgetLabel: UILabel = { //mainStackView
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
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
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(moveToMainScene), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var registerLabel: UILabel = { //bottomStackView
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.text = "Ещё нет аккаунта?"
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
        emailTextField.isValid = emailIsValid(email: email)
        
        guard emailIsValid(email: email) else {return}
        
        let personalAreaVC = PersonalAreaViewController()
        personalAreaVC.modalPresentationStyle = .fullScreen
        self.present(personalAreaVC, animated: true)
        }
    
    @objc func moveToRecovery() {
        let recoveryVC = RecoveryViewController()
        recoveryVC.modalPresentationStyle = .fullScreen
        self.present(recoveryVC, animated: true)
    }
    
    @objc func moveToRegister() {
        let registerVC = RegisterViewController()
        registerVC.modalPresentationStyle = .fullScreen
        self.present(registerVC, animated: true)
    }
    //MARK: - FUNC's
    private func emailIsValid(email: String) -> Bool {
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
    //MARK: - SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
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
        //setupButton()
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
        mainStackView.addArrangedSubview(passwordTextField)
        mainStackView.addArrangedSubview(forgetLabel)
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 41).isActive = true
        
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
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
}

