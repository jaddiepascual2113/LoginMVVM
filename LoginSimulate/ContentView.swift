//
//  ContentView.swift
//  LoginSimulate
//
//  Created by Jaddie Allaine Pascual on 3/4/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.top, geometry.size.height * 0.1)
                
                Spacer()
                
                TextField("Username", text: $viewModel.username)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .autocapitalization(.none)
                    .frame(width: geometry.size.width * 0.8)
                
                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .frame(width: geometry.size.width * 0.8)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                }
                
                Button(action: {
                    viewModel.login()
                }) {
                    Text("Login")
                        .padding()
                        .frame(width: geometry.size.width * 0.8)
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                .padding()
                
                if viewModel.isLoading {
                    ProgressView("Logging in...")
                        .progressViewStyle(CircularProgressViewStyle(tint: .blue))
                        .padding()
                }
                
                NavigationLink(destination: WelcomeView(viewModel: viewModel), isActive: $viewModel.isLoggedIn) {
                    EmptyView()
                }
                
                Spacer()
            }
            .padding()
        }
    }
}



struct ContentView: View {
    var body: some View {
        LoginView()
    }
}
