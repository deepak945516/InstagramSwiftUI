//
//  LoginInputField.swift
//  LearningSwiftUI
//
//  Created by macadmin on 17/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

struct LoginInputField: View {
    @Binding var value: String
    var inputFieldData: InputFieldData
    var body: some View {
        VStack {
            TextField(inputFieldData.placeholader, text: $value)
                .keyboardType(inputFieldData.keyboardType)
                .textContentType(inputFieldData.textContentStyle)
                //.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .frame(height: 50)
                .background(Color.white)
                .cornerRadius(25)
        }
    }
}

struct LoginInputField_Previews: PreviewProvider {
    static var previews: some View {
        LoginInputField(value: Binding.constant("Username"), inputFieldData: .username)
    }
}
