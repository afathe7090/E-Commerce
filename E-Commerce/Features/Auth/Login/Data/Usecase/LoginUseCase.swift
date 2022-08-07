//
//  LoginUseCase.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation


class LoginUseCase {
    
    private let repo: LoginRepo
    
    init(repo: LoginRepo = LoginRepoImplementation()) {
        self.repo = repo
    }
    

    
}
