//
//  ViewController.swift
//  UIKit_programatically
//
//  Created by Aleksandr Mamlygo on 12.06.23.
//

import UIKit

final class MainViewController: UIViewController {
    
    private let stackView = UIStackView()
    private var segmentedControl = UISegmentedControl()
    private let mainLabel = CustomLabel(title: "Done")
    private let slider = UISlider()
    private let textField = UITextField()
    private let doneButton = UIButton()
    private let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    //MARK: Actions
    @objc
    private func segmentedControlAction() {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            mainLabel.text = "The first segment is selected"
            mainLabel.textColor = .red
        case 1:
            mainLabel.text = "The second segment is selected"
            mainLabel.textColor = .yellow
        default:
            mainLabel.text = "The third segment is selected"
            mainLabel.textColor = .green
        }
    }
    
    @objc
    private func sliderAction() {
        mainLabel.text = slider.value.formatted()
        view.backgroundColor = view.backgroundColor?.withAlphaComponent(CGFloat(slider.value))
    }
    
    @objc
    private func datePickerAction(_ sender: UIDatePicker) {
        mainLabel.text = sender.date.formatted(date: .long, time: .omitted)
    }
    
    @objc
    private func doneButtonActon() {
        let secondVC = SecondViewController()
        
        present(secondVC, animated: true)
    }
    
}

//MARK: Settings of View
private extension MainViewController {
    func setupView() {
        view.backgroundColor = .secondarySystemBackground
        
        setupSegmentedControl()
        setupSlider()
        setupTextField()
        setupDoneButton()
        setupDatePicker()
        
        setupStackView()
        setupLayout()
        addActions()
    }
}

//MARK: Settings of UI elements
private extension MainViewController {
    
    func setupSlider() {
        slider.minimumValue = 0
        slider.maximumValue = 1
        slider.setValue(0.5, animated: true)
        slider.thumbTintColor = .purple
        slider.minimumTrackTintColor = .systemPink
    }
    
    func setupTextField() {
        textField.placeholder = "Enter your name"
        textField.borderStyle = .roundedRect
        textField.font = UIFont.systemFont(ofSize: 14)
    }
    
    func setupDoneButton() {
        doneButton.setTitle("Done", for: .normal)
        doneButton.backgroundColor = .mainBackground
        doneButton.layer.cornerRadius = 8
        doneButton.setTitleColor(.highlightedColor, for: .highlighted)
    }
    
    func setupSegmentedControl() {
        segmentedControl = UISegmentedControl(items: ["First", "Second", "Third"])
        segmentedControl.selectedSegmentIndex = 0
    }
    
    func setupDatePicker() {
        datePicker.datePickerMode = .date
        datePicker.preferredDatePickerStyle = .wheels
    }
    
    func setupStackView() {
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 40
        
        view.addSubview(stackView)
        
        [segmentedControl, mainLabel, slider,
         textField, doneButton, datePicker].forEach { subView in
            stackView.addArrangedSubview(subView)
        }
    }
    
    func addActions() {
        segmentedControl.addTarget(
            self,
            action: #selector(segmentedControlAction),
            for: .valueChanged
        )
        
        slider.addTarget(
            self,
            action: #selector(sliderAction),
            for: .valueChanged
        )
        
        datePicker.addTarget(
            self,
            action: #selector(datePickerAction),
            for: .valueChanged
        )
        
        doneButton.addTarget(
            self,
            action: #selector(doneButtonActon),
            for: .touchUpInside
        )
    }
}


//MARK: Layout settings

private extension MainViewController {
    func setupLayout() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor,
                constant: 40
            ),
            stackView.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            stackView.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            )
        ])
    }
}
