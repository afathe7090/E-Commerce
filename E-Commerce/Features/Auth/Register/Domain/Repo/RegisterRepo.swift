//
//  LoginRepo.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase


protocol RegisterRepo {
    func signUp(email: String , password: String) async throws -> AuthDataResult
}
