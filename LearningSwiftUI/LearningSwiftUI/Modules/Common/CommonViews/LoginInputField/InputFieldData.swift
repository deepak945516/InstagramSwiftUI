//
//  InputFieldData.swift
//  LearningSwiftUI
//
//  Created by macadmin on 18/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

enum InputFieldData {
    case username
    case password
    
    var placeholader: String {
        switch self {
        case .username:
            return kPleaseUsername
        case .password:
            return kPleasePassword
        }
    }
    
    var keyboardType: UIKeyboardType {
        switch self {
        case .username:
            return .emailAddress
        default:
            return .default
        }
    }
    
    var textContentStyle: UITextContentType {
        switch self {
        case .username:
            return .emailAddress
        case .password:
            return .password
        }
    }
}

