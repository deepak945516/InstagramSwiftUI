//
//  LoginVM.swift
//  LearningSwiftUI
//
//  Created by macadmin on 18/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

class LoginVM: ObservableObject {
    @Published var showAlert: Bool = false
    @Published var showLoader: Bool = false
    var alertMessage: String = ""
     
    
    func loginBtnTapped(username: String, password: String) {
        //showLoader = true
        if !SwiftHelper.isValid(email: username) {
            self.showAlert = true
            self.alertMessage = kPleaseValidEmail
        } else if !SwiftHelper.isValid(password: password) {
            self.showAlert = true
            self.alertMessage = kPleaseValidPassword
        } else if let sceneDelegate = SwiftHelper.getSceneDelegate(), let window = sceneDelegate.window {
            window.rootViewController = UIHostingController(rootView: HomeView())
            window.makeKeyAndVisible()
        }
    }
}

extension UIColor {
    public static var tint: UIColor = {
        if #available(iOS 13, *) {
            return UIColor { (UITraitCollection: UITraitCollection) -> UIColor in
                if UITraitCollection.userInterfaceStyle == .dark {
                    /// Return the color for Dark Mode
                    return .blue//Colors.osloGray
                } else {
                    /// Return the color for Light Mode
                    return .blue//Colors.dataRock
                }
            }
        } else {
            /// Return a fallback color for iOS 12 and lower.
            return .blue//Colors.dataRock
        }
    }()
}
