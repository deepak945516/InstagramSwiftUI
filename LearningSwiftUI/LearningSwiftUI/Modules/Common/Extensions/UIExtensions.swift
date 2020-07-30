//
//  UIExtensions.swift
//  LearningSwiftUI
//
//  Created by macadmin on 18/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

// MARK: - UIApplication
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
