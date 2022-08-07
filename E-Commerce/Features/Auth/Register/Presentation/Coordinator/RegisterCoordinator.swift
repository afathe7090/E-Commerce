//
//  LoginCoordinator.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import UIKit

class RegisterCoordinator: BaseCoordinatorImplementation {
    
    
    weak var parentCoordinator: LoginCoordinator?
    
    init(rootNavigation: UINavigationController) {
        super.init()
        self.navigationController = rootNavigation
    }
    
    
    override func startCoordinator() {
        guard let registerVCContainer = container.resolve(RegisterViewController.self, argument: self) else { return }
        navigationController.navigationBar.isHidden = true
        self.navigationController.pushViewController(registerVCContainer, animated: true)
    }
    
    func didFinishView(){
        parentCoordinator?.popToMySelf(coordinator: self)
        navigationController.popViewController(animated: true)
    }
    
    
}
