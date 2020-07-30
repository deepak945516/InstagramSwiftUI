//
//  SwiftHelper.swift
//  LearningSwiftUI
//
//  Created by macadmin on 18/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

struct SwiftHelper {
    private init() {}
    
    static var loader: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView()
        //loader.color = .gray
        loader.hidesWhenStopped = true
        loader.style = .large
        return loader
    }()
    
    static func endEditing() {
        UIApplication.shared.endEditing()
    }
    
    static func isValid(email: String) -> Bool {
        return email.count > 5
    }
    
    static func isValid(password: String) -> Bool {
        return password.count > 5
    }
    
    static func getSceneDelegate() -> SceneDelegate? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate {
            return sceneDelegate
        }
        return nil
    }
    
    static func showAlertOnWindow(title: String, message: String) {
        guard let sceneDelegate = getSceneDelegate(), let window = sceneDelegate.window else {
            return
        }
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alertController.addAction(action)
        window.rootViewController?.present(alertController, animated: true, completion: nil)
    }
    
    static func showHideLoaderOnWindow(interactionAllowed: Bool = false) {
        guard let sceneDelegate = getSceneDelegate(), let window = sceneDelegate.window else {
            return
        }
        if loader.window != window {
            if interactionAllowed {
                loader.center = window.center
            }
            window.rootViewController?.view.addSubview(loader)
        }
        if loader.isAnimating {
            loader.stopAnimating()
        } else {
            loader.startAnimating()
        }
    }
}
