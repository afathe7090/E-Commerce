//
//  LoginRepoImplementation.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase


class RegisterRepoImplementation: RegisterRepo {
   
    
    var firebase: RegisterFirebase!
    
    
    //MARK: - Init
    init(firebase: RegisterFirebase = FirebaseAuthentication()) {
        self.firebase = firebase
    }
    
    //MARK: - Sign Up
    func signUp(email: String , password: String) async throws -> AuthDataResult {
        return try await firebase.signUp(email: email, password: password)
    }
    
}
