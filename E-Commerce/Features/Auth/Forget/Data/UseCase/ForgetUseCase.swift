//
//  ForgetUseCase.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import Foundation

class ForgetUseCase {
    
    
    private let repo: ForgetRepo
    
    init(repo: ForgetRepo = ForgetRepoImplementation()) {
        self.repo = repo
    }
    
    
    
}
