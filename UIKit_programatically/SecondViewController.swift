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
    
    private let eMailTextField = CustomTextField(placeholder: " Enter your email")
    private let passwordTextField = CustomTextField(placeholder: " Enter password", isPrivate: true)
    
    private let mainStack = UIStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
}

//MARK: -View settings
private extension SecondViewController {
    func setupView() {
        view.backgroundColor = .white
        
        setupShowPassButton()
        setupStackView()
        setupLayout()
        addActions()
    }
}

//MARK: -UI Elements settings
private extension SecondViewController {
    func setupStackView() {
        mainStack.axis = .vertical
        mainStack.distribution = .fill
        mainStack.spacing = 40
        
        view.addSubview(mainStack)
        
        [showPassButton, eMailTextField, passwordTextField].forEach { subView in
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
    }
    
    @objc
    func togglePasswordVisibility() {
        passwordTextField.isSecureTextEntry.toggle()
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
