//
//  CustomTextField.swift
//  UIKit_programatically
//
//  Created by Aleksandr Mamlygo on 13.06.23.
//

import UIKit


final class CustomTextField: UITextField {
    
    //MARK: -Initializer
    init(placeholder: String, isPrivate: Bool = false) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder, isPrivate: isPrivate)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: -Private text field
    private func setupTextField(placeholder: String, isPrivate: Bool) {
        textColor = .white
        
        layer.cornerRadius = 10
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.white.cgColor
        layer.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        
        attributedPlaceholder = NSAttributedString(
            string: placeholder,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan]
        )
        
        font = .boldSystemFont(ofSize: 18)
        heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        if isPrivate {
            isSecureTextEntry = true
        }
    }
    
}
