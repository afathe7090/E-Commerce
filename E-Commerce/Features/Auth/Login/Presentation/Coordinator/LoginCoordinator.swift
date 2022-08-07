//
//  LoginCoordinator.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import UIKit



class LoginCoordinator: BaseCoordinatorImplementation {
    
    init(rootNavigation: UINavigationController) {
        super.init()
        self.navigationController = rootNavigation
    }
    
    
    override func startCoordinator() {
        guard let loginVCContainer = container.resolve(LoginViewController.self ,argument: self) else { return }
        navigationController.navigationBar.isHidden = true
        self.navigationController.setViewControllers([loginVCContainer], animated: true)
    }
    
    
    func pushToRegisterViewCOntroller(){
        let registerCoordinator = RegisterCoordinator(rootNavigation: navigationController)
        registerCoordinator.parentCoordinator = self
        childCoordinators.append(registerCoordinator)
        registerCoordinator.startCoordinator()
        
    }
    
    func pushToForgetPasswordViewController(){
        let forgetCoordinator = ForgetCoordinator(rootNavigation: navigationController)
        forgetCoordinator.parentCoordinator = self
        childCoordinators.append(forgetCoordinator)
        forgetCoordinator.startCoordinator()
    }
    
    
    func popToMySelf(coordinator: Coordinator){
        self.didChildCoordinator(coordinator) { _ in }
    }
    
}
