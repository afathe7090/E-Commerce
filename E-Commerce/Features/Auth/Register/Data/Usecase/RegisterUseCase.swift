//
//  LoginUseCase.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation


class RegisterUseCase {
    
    private let repo: RegisterRepo
    
    init(repo: RegisterRepo = RegisterRepoImplementation()) {
        self.repo = repo
    }
    
    func TestPrint(){
        repo.TestPrint()
    }
    

}
