//
//  LoginRepo.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import Firebase


protocol LoginRepo {
    func signIn(email: String , password: String)  async throws  ->  AuthDataResult
}
