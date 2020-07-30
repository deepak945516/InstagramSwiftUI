//
//  ForgotPassword.swift
//  LearningSwiftUI
//
//  Created by macadmin on 17/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

struct ForgotPassword: View {
    @State private var isOn: Bool = false
    let applePay = ApplePayManager(countryCode: "IN", currencyCode: "INR")
    var body: some View {
        VStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                Toggle("Push Notification", isOn: $isOn)
                
                Toggle("Is Admin", isOn: $isOn)
                
            }
            
            VStack {
                Toggle(isOn: $isOn) {
                    Text("Email Pushh")
                }
                //.toggleStyle(CheckboxToggleStyle())
            }
            
            Image("applePay")
                .onTapGesture {
                    self.applePay.buyBtnTapped()
            }
        }
        .padding()
    }
}

struct ForgotPassword_Previews: PreviewProvider {
    static var previews: some View {
        ForgotPassword()
    }
}
