//
//  LoginDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import Swinject


extension Container {
    
    func registerDependencyContainerization(){
        
        register(RegisterRepo.self) { _ in
            RegisterRepoImplementation.init()
        }
        
        register(RegisterUseCase.self) { resolver in
            guard let repo = resolver.resolve(RegisterRepo.self) else { fatalError() }
            return RegisterUseCase(repo: repo)
        }
        
        register(RegisterVIewModel.self) { (resolver, coordinator: RegisterCoordinator) in
            guard let useCase = resolver.resolve(RegisterUseCase.self) else{ fatalError() }
            let registerViewModel = RegisterVIewModel(useCase: useCase)
            registerViewModel.coordinator = coordinator
            return registerViewModel
        }
        
        register(RegisterViewController.self) { (resolver, coordinator: RegisterCoordinator) in
            guard let viewModel = resolver.resolve(RegisterVIewModel.self, argument: coordinator) else { return RegisterViewController() }
            return RegisterViewController(viewModel: viewModel)
        }
        
    }
    
    
}

