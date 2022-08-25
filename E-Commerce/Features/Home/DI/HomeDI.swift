//
//  LoginDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit
import Swinject


extension Container {
    
    func homeDependencyContainerization(){
        
        register(HomeRepo.self) {  resolver  in
            return HomeRepoImplementation()
        }
        
        register(HomeUseCase.self) { resolver in
            guard let repo = resolver.resolve(HomeRepo.self) else { return HomeUseCase() }
            return HomeUseCase(repo: repo)
        }
        
        register(HomeVIewModel.self) { (resolver, coordinator: HomeCoordinator) in
            guard let useCase = resolver.resolve(HomeUseCase.self) else{ return HomeVIewModel()}
            let homeViewModel = HomeVIewModel(useCase: useCase)
            homeViewModel.coordinator = coordinator
            return homeViewModel
        }
        
        register(HomeViewController.self) { (resolver, coordinator: HomeCoordinator) in
            guard let viewModel = resolver.resolve(HomeVIewModel.self, argument: coordinator) else { return HomeViewController() }
            return HomeViewController(viewModel: viewModel)
        }
        
    }
    
    
}

