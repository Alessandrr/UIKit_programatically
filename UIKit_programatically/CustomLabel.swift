//
//  CustomLabel.swift
//  UIKit_programatically
//
//  Created by Aleksandr Mamlygo on 13.06.23.
//

import UIKit

final class CustomLabel: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        setupLabel(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLabel(title: String) {
        text = title
        font = .systemFont(ofSize: 17)
        numberOfLines = 1
    }
}
