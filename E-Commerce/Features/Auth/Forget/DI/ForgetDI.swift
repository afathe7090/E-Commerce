//
//  ForgetDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import Foundation
import Swinject


extension Container {
        
    func forgetDependencyContainerization(){
        
        register(ForgetRepo.self) { _ in
            ForgetRepoImplementation.init()
        }
        
        register(ForgetUseCase.self) { resolver in
            guard let repo = resolver.resolve(ForgetRepo.self) else { return ForgetUseCase() }
            return ForgetUseCase(repo: repo)
        }
        
        register(ForgetViewModel.self) { (resolver, coordinator: ForgetCoordinator) in
            guard let useCase = resolver.resolve(ForgetUseCase.self) else{ return ForgetViewModel()}
            let forgetViewModel = ForgetViewModel(useCase: useCase)
            forgetViewModel.coordinator = coordinator
            return forgetViewModel
        }
        
        register(ForgetViewController.self) { (resolver, coordinator: ForgetCoordinator) in
            guard let viewModel = resolver.resolve(ForgetViewModel.self, argument: coordinator) else { return ForgetViewController() }
            return ForgetViewController(viewModel: viewModel)
        }
    }
    
    
}
