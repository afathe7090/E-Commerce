//
//  LoginRepoImplementation.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import Firebase

class LoginRepoImplementation: LoginRepo {
    
    var firebase: LoginFirebase!
    
    init( firebase: LoginFirebase = FirebaseAuthentication()) {
        self.firebase = firebase
    }
    
    
    func signIn(email: String, password: String) async throws -> AuthDataResult {
        return try await firebase.signIn(email: email, password: password)
    }
    
}
