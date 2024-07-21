//
//  ValidatableTextField.swift
//  termeet
//
//  Created by Polina Popova on 19/07/2024.
//

import UIKit

enum ValidatableTextFieldStyle {
    
    case light
    case dark
}

class ValidatableTextField: UIStackView {
//CGColor(red: 245, green: 245, blue: 245, alpha: 1)
    private let validTextFieldColor: CGColor = AppColors.black300.cgColor
    private let invalidTextFieldColor: CGColor = AppColors.red300.cgColor
    
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17, weight: .regular)
        
        return label
    }()
    
    private lazy var textField: InsetedTextField = {
        let textField = InsetedTextField()
        textField.backgroundColor = AppColors.black100
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.layer.borderColor = CGColor(red: 231, green: 233, blue: 237, alpha: 1)
        
        
        textField.borderStyle = .roundedRect
        layer.cornerRadius = 15
        textField.layer.cornerRadius = 15
       
        textField.font = .systemFont(ofSize: 17, weight: .regular)
        textField.layer.borderColor = CGColor(red: 134, green: 137, blue: 139, alpha: 1)
        
        return textField
    }()
    
    private lazy var invalidLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textColor = AppColors.red300
        label.isHidden = true
        
        return label
    }()
    
    var isValid: Bool = true {
        didSet {
            invalidLabel.isHidden = isValid
            textField.layer.borderColor = isValid ? validTextFieldColor : invalidTextFieldColor
        }
    }
    
    var text: String? {
        get {
            textField.text
        }
        set {
            textField.text = newValue
        }
    }
    
    var underlyingTextField: UITextField {
        textField
    }
    
    init() {
        super.init(frame:.zero)
        setupLayout()
    }
    
    required init(coder: NSCoder) {
        fatalError("ERROR ValidatableTextField")
    }
    required override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup(title: String?, placeholder: String?, invalidTitle: String?, style: ValidatableTextFieldStyle = .dark) {
        titleLabel.text = title
        titleLabel.numberOfLines = 0
        textField.placeholder = placeholder
        textField.frame = CGRect(x: 10, y: 10, width: 200, height: 46)
        textField.borderStyle = .roundedRect
        textField.backgroundColor = AppColors.white
        
        if style == .light {
            textField.borderStyle = .roundedRect
        } else {
            textField.borderStyle = .none
            textField.layer.borderColor = AppColors.termeetStroke.cgColor
            textField.layer.cornerRadius = 10
            textField.layer.borderWidth = 1
        }
//        textField.delegate = self
        invalidLabel.text = invalidTitle
    }
    
    private func setupLayout() {
        backgroundColor = .white
        spacing = 16
        axis = .vertical
        
        addArrangedSubview(titleLabel)
        addArrangedSubview(textField)
        addArrangedSubview(invalidLabel)
        setCustomSpacing(8, after: textField)
        
//        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
//    @objc func textFieldDidChange(_ textField: UITextField) {
//        if let text = textField.text, let number = NumberFormatter().number(from: text), let formatter {
//            textField.text = formatter.string(for: number)
//        }
//    }



}

extension ValidatableTextField: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let mask = "dd.mm.yyyy"

            guard let textFieldText = textField.text as NSString? else {
                return false
            }

            let newString = textFieldText.replacingCharacters(in: range, with: string)
            let components = newString.components(separatedBy: CharacterSet.decimalDigits.inverted)

            let decimalString = components.joined()

            // Check if the decimal string follows the mask "ddmmyyyy"
            if decimalString.count <= mask.count {
                let formatter = NumberFormatter()
                formatter.numberStyle = .decimal
                formatter.minimumFractionDigits = 0
                formatter.maximumFractionDigits = 0

                if let number = formatter.number(from: decimalString) {
                    let formattedString = String(format: "%02d.%02d.%04d", number.intValue / 1000000, (number.intValue / 10000) % 100, number.intValue % 10000)
                    textField.text = formattedString
                }
            }

            return false
        }

}

