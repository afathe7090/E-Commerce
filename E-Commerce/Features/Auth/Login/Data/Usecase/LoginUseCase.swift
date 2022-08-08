//
//  LoginUseCase.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import Firebase

class LoginUseCase {
    
    private let repo: LoginRepo
    
    init(repo: LoginRepo = LoginRepoImplementation()) {
        self.repo = repo
    }
    
    
    //MARK: - Sign In
    
    func signIn(email: String, password: String) async throws -> AuthDataResult  {
        return try await repo.signIn(email: email , password: password)
    }
   

    
}
