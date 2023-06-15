//
//  Validate.swift
//  UIKit_programatically
//
//  Created by Aleksandr Mamlygo on 14.06.23.
//

import Foundation

struct Validate {
    static func isValidPassword(text: String) -> Bool {
        if let _ = Int(text) {
            return true
        }
        
        return false
    }
}
