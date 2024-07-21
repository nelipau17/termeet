//
//  RegisterWelcomeViewController.swift
//  termeet
//
//  Created by Polina Popova on 20/07/2024.
//

import UIKit

class RegisterWelcomeViewController: UIViewController {
    let leadingInset: CGFloat = 16
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
        logoImageView.widthAnchor.constraint(equalToConstant: 42.13).isActive = true
        logoImageView.heightAnchor.constraint(equalToConstant: 58.00).isActive = true
        
        mainStackView.addArrangedSubview(welcomeLabel)
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: leadingInset).isActive = true
        
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

}
