//
//  FirebaseAuthentication.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import Foundation
import Firebase


protocol LoginFirebase {
    func signIn(email: String , password: String)  async throws  ->  AuthDataResult
}

protocol RegisterFirebase{
    func signUp(email: String , password: String) async throws -> AuthDataResult
}

protocol ForgetFirebase {
    func forgetPassword(email: String) async throws
}


class FirebaseAuthentication {
    init() {   }
}


extension FirebaseAuthentication: LoginFirebase {
    
    
    func signIn(email: String , password: String)  async throws  ->  AuthDataResult  {
        return try await withCheckedThrowingContinuation { continuation in
            Auth.auth().signIn(withEmail: email, password: password) { result, error in
                if let result = result { continuation.resume(returning: result) }
                if let error = error { continuation.resume(throwing: error) }
            }
        }
    }
    
}

extension FirebaseAuthentication: ForgetFirebase {
    
    func forgetPassword(email: String) async throws {
        return try await withCheckedThrowingContinuation({ continuation in
            Auth.auth().sendPasswordReset(withEmail: email) { error in
                if let error = error { continuation.resume(throwing: error)}
            }
        })
    }
    
    
}


extension FirebaseAuthentication: RegisterFirebase {
    
    func signUp(email: String , password: String) async throws -> AuthDataResult {
        return try await withCheckedThrowingContinuation({ continuation in
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let result = result { continuation.resume(returning: result) }
                if let error = error { continuation.resume(throwing: error) }
            }
        })
    }
    
    
}
