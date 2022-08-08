//
//  LoginUseCase.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase

class RegisterUseCase {
    
    private let repo: RegisterRepo
    
    init(repo: RegisterRepo = RegisterRepoImplementation()) {
        self.repo = repo
    }
  
    
    func signUp(email: String , password: String) async throws -> AuthDataResult {
        return try await repo.signUp(email: email, password: password)
    }
    

}
