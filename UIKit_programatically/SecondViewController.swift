//
//  SecondViewController.swift
//  UIKit_programatically
//
//  Created by Aleksandr Mamlygo on 13.06.23.
//

import UIKit

class SecondViewController: UIViewController {
    
    private let bgView = UIView()
    private let showPassButton = UIButton()
    private let doneButton = UIButton()
    
    private let eMailTextField = CustomTextField(placeholder: " Enter your email")
    private let passwordTextField = CustomTextField(placeholder: " Enter password", isPrivate: true)
    
    private let mainStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        eMailTextField.becomeFirstResponder()
    }
    
    @objc
    func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
    }
}

//MARK: -View settings
private extension SecondViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupShowPassButton()
        setupDoneButton()
        setupStackView()
        setupLayout()
        
        addActions()
        appointDelegates()
    }

}

//MARK: -UI Elements settings
private extension SecondViewController {
    func setupStackView() {
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.spacing = 40
        
        view.addSubview(mainStack)
        
        [showPassButton, eMailTextField, passwordTextField, doneButton].forEach { subView in
            mainStack.addArrangedSubview(subView)
        }
    }
    
    func setupBgView() {
        bgView.backgroundColor = .mainBackground
    }
    
    func setupShowPassButton() {
        showPassButton.setTitle("Show pass", for: .normal)
        showPassButton.setTitleColor(.systemPink, for: .normal)
        showPassButton.setTitleColor(.highlightedColor, for: .highlighted)
        showPassButton.setTitleColor(.black, for: .disabled)
        showPassButton.isEnabled = false
    }
    
    func setupDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.setTitleColor(.blue, for: .normal)
    }
    
    func appointDelegates() {
        eMailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    func addActions() {
        showPassButton.addTarget(
            self,
            action: #selector(togglePasswordVisibility),
            for: .touchDown
        )
        
        showPassButton.addTarget(
            self,
            action: #selector(togglePasswordVisibility),
            for: [.touchUpInside, .touchCancel]
        )
    }
}

//MARK: - Layout settings
private extension SecondViewController {
    func setupLayout() {
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainStack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            mainStack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            mainStack.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
    }
}


// MARK: -UITextFieldDelegate
extension SecondViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == eMailTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            view.endEditing(true)
        }
        
        return true
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let passwordInput = textField.text else { return }
        
        showPassButton.isEnabled = !passwordInput.isEmpty
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        switch textField {
        case passwordTextField:
            return Validate.isValidPassword(text: string)
        default:
            break
        }
        
        return true
    }
}
