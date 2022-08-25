//
//  LoginCoordinator.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import UIKit



class HomeCoordinator: BaseCoordinatorImplementation {
    
    init(rootNavigation: UINavigationController) {
        super.init()
        self.navigationController = rootNavigation
    }
    
    
    override func startCoordinator() {
    }
    
    override func startCoordinatorWithNavigationController() -> UINavigationController {
        
        guard let homeViewContainer = container.resolve(HomeViewController.self ,
                                                        argument: self) else { return UINavigationController()}
        
        self.navigationController = UINavigationController(rootViewController: homeViewContainer)
        return navigationController
    }
    
    
    
    func popToMySelf(coordinator: Coordinator){
        self.didChildCoordinator(coordinator) { _ in }
    }
    
}
