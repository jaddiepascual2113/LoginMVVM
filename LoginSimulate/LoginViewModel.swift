//
//  LoginViewModel.swift
//  LoginSimulate
//
//  Created by Jaddie Allaine Pascual on 3/4/25.
//

import Foundation
import Combine

class LoginViewModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
    @Published var isLoggedIn: Bool = false
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false
    
    func login() {
        self.isLoading = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            if self.username == self.username && self.password == "password" {
                self.isLoggedIn = true
                self.errorMessage = nil
            } else if self.username == "" && !(self.password == "") {
                self.errorMessage = "Please enter Username"
            } else if !(self.username == "") && self.password == "" {
                self.errorMessage = "Please enter Password"
            } else if self.username == "" && self.password == "" {
                self.errorMessage = "Please enter Username & Password"
            } else {
                self.errorMessage = "Invalid credentials"
            }
            self.isLoading = false
        }
    }
    
    func logout() {
        isLoggedIn = false
        username = ""
        password = ""
    }
}


