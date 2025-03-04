//
//  WelcomeView.swift
//  LoginSimulate
//
//  Created by Jaddie Allaine Pascual on 3/4/25.
//

import SwiftUI

struct WelcomeView: View {
    @ObservedObject var viewModel: LoginViewModel
    
    var body: some View {
            VStack {
                Text("Welcome, \(viewModel.username.capitalized)")
                    .font(.largeTitle)
                    .padding()
                
                Button(action: {
                    viewModel.logout()
                }) {
                    Text("Logout")
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                    .navigationBarBackButtonHidden(true)
                    .navigationTitle("")
            }
    }
}



