//
//  RegisterMailViewController.swift
//  termeet
//
//  Created by Polina Popova on 20/07/2024.
//

///!!! Сделать кнопку рабочей только по истечении времени
import UIKit

class RegisterMailViewController: UIViewController {
    private let leadingInset: CGFloat = 16
    
    var startTime: Date?
    var timer: Timer?
    var endTime: Date?
    
    //MARK: - TIMER
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .right
        label.textColor = AppColors.black500
        return label
    }()
    
    @objc func updateTime() {
        guard let endTime = endTime else { return }
        let remainingTime = round(endTime.timeIntervalSinceNow)
        if remainingTime <= 0 {
            // Timer has reached zero, stop the timer
            timer?.invalidate()
            timer = nil
            timeLabel.text = "0:00"
            loginButton.backgroundColor = AppColors.termeetMain
        } else {
            let minutes = Int(remainingTime) / 60
            let seconds = Int(remainingTime) - minutes*60
            timeLabel.text = String(format: "%01d", minutes) + ":" + String(format: "%02d", seconds)
            timeLabel.font = .systemFont(ofSize: 14, weight: .regular)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)

        timer?.invalidate()
        timer = nil
    }
    
    //MARK: - ELEMENTS
    private lazy var interimButton: UIButton = {
        let button = UIButton()
        button.setTitle("Next Scene ->", for: .normal)
        button.backgroundColor = AppColors.termeetStroke
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(moveToInfo), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 30, weight: .heavy)
        label.textAlignment = .left
        label.text = "Регистрация"
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        label.textAlignment = .left
        label.text = "На вашу почту было отправлено письмо с ссылкой для подтверждения. Если письмо долго не приходит, проверьте папку спам и запросите его повторно"
        label.numberOfLines = 10
        return label
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Отправить новое письмо", for: .normal)
        button.backgroundColor = AppColors.termeetStroke
        button.titleLabel?.font = .systemFont(ofSize: 16)
        button.layer.cornerRadius = 15
        button.setTitleColor(AppColors.white, for: .normal)
        
        button.addTarget(self, action: #selector(sendEmail), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: - Button Action
    @objc func sendEmail() {
        loginButton.backgroundColor = AppColors.termeetStroke
    }
    
    @objc func moveToInfo() {
        let infoVC = RegisterInfoViewController()
        infoVC.modalPresentationStyle = .fullScreen
        self.present(infoVC, animated: true)
    }
    //MARK: - SETUP
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupLayout()
        setupTimer()
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupLayout() {
        setupLabel()
        setupText()
        setupButton()
        setupInterimElem()
    }
    
    private func setupLabel() {
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 44).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }
    
    private func setupText() {
        view.addSubview(textLabel)
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 61).isActive = true
        textLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
    }
    
    private func setupButton() {
        view.addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -43).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 54).isActive = true
    }

    private func setupTimer() {
        view.addSubview(timeLabel)
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        timeLabel.topAnchor.constraint(equalTo: loginButton.topAnchor, constant: -20).isActive = true
        
        startTime = Date()
        
        endTime = Date().addingTimeInterval(180)
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    private func setupInterimElem() {
        view.addSubview(interimButton)
        interimButton.translatesAutoresizingMaskIntoConstraints = false
        interimButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        interimButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
