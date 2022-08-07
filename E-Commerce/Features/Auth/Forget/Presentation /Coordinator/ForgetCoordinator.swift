//
//  ForgetCoordinator.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import UIKit

class ForgetCoordinator: BaseCoordinatorImplementation {
    
    
    
    weak var parentCoordinator: LoginCoordinator?
    
    init(rootNavigation: UINavigationController) {
        super.init()
        self.navigationController = rootNavigation
    }
    
    
    override func startCoordinator() {
        guard let registerVCContainer = container.resolve(ForgetViewController.self, argument: self) else { return }
        navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(registerVCContainer, animated: true)
    }
    
    func didFinishView(){
        parentCoordinator?.popToMySelf(coordinator: self)
        navigationController.popViewController(animated: true)
    }
    
    
    
}
