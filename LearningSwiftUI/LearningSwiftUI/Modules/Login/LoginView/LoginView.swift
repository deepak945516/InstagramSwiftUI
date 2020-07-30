//
//  ContentView.swift
//  LearningSwiftUI
//
//  Created by macadmin on 17/06/20.
//  Copyright © 2020 macadmin. All rights reserved.
//

import SwiftUI

extension Color {
    static let myYellow = Color("MyYellow")
}

struct LoginView: View {
    @ObservedObject var loginVM = LoginVM()
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        LoadingView(isShowing: .constant(loginVM.showLoader)) {
            NavigationView {
                ZStack {
                    Rectangle()
                        .foregroundColor(.yellow)
                        .edgesIgnoringSafeArea(.all)
                    Rectangle()
                        .foregroundColor(Color.pink)
                        .edgesIgnoringSafeArea(.all)
                        .rotationEffect(Angle(degrees: 45))
                    VStack {
                        Spacer()
                        LoginInputField(value: self.$username, inputFieldData: .username)
                            .padding(.bottom)
                        //LoginInputField(value: self.$password, inputFieldData: .password)
                        
                        SecureField(InputFieldData.password.placeholader, text: self.$password)
                            .keyboardType(InputFieldData.password.keyboardType)
                            .textContentType(InputFieldData.password.textContentStyle)
                            .padding()
                            .frame(height: 50)
                            .background(Color.white)
                            .cornerRadius(25)
                        
                        HStack {
                            Spacer()
                            // Forgot password
                            NavigationLink(destination: ForgotPassword()) {
                                Text(kForgotPassword)
                                    .foregroundColor(.white)
                                    .frame(height: 40)
                            }
                        }
                        
                        Button(action: {
                            // Login
                            self.loginVM.loginBtnTapped(username: self.username, password: self.password)
                        }) {
                            Text(kLogIn)
                                .fontWeight(.bold)
                                .frame(width: 200
                                    , height: 50)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(25)
                        }
                        .padding()
                        Spacer()
                        HStack {
                            Text(kDontHaveAccount)
                            Button(action: {
                                // SignUp
                                SwiftHelper.showHideLoaderOnWindow()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    SwiftHelper.showHideLoaderOnWindow()
                                }
                            }) {
                                Text(kSignUp)
                            }
                        }
                    }
                    .padding()
                }
                .navigationBarTitle(kLogIn)
                .alert(isPresented: .constant(self.loginVM.showAlert)) { () -> Alert in
                    Alert(title: Text(kAlert), message: Text(self.loginVM.alertMessage), dismissButton: .default(Text(kOk), action: {
                        self.loginVM.showAlert = false
                    }))
                }
            }
            .navigationViewStyle(StackNavigationViewStyle())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        //LoginView()
        Group {
           LoginView()
            .environment(\.colorScheme, .light)

           LoginView()
              .environment(\.colorScheme, .dark)
        }
    }
}
