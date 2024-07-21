//
//  InsetedTextField.swift
//  termeet
//
//  Created by Polina Popova on 19/07/2024.
//

import UIKit

class InsetedTextField: UITextField {

    let padding = UIEdgeInsets(top: 12, left: 12, bottom: 12, right: 12);

        override func textRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

        override func editingRect(forBounds bounds: CGRect) -> CGRect {
            return bounds.inset(by: padding)
        }

}
