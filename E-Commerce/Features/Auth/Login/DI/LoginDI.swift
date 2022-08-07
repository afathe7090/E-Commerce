//
//  LoginDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit
import Swinject


extension Container {
    
    func loginDependencyContainerization(){
        
        register(LoginRepo.self) { _ in
            LoginRepoImplementation.init()
        }
        

        register(LoginUseCase.self) { resolver in
            guard let repo = resolver.resolve(LoginRepo.self) else { return LoginUseCase() }
            return LoginUseCase(repo: repo)
        }
        
        register(LoginVIewModel.self) { (resolver, coordinator: LoginCoordinator) in
            guard let useCase = resolver.resolve(LoginUseCase.self) else{ return LoginVIewModel()}
            let loginViewModel = LoginVIewModel(useCase: useCase)
            loginViewModel.coordinator = coordinator
            return loginViewModel
        }
        
        register(LoginViewController.self) { (resolver, coordinator: LoginCoordinator) in
            guard let viewModel = resolver.resolve(LoginVIewModel.self, argument: coordinator) else { return LoginViewController() }
            return LoginViewController(viewModel: viewModel)
        }
        
    }
    
    
}

