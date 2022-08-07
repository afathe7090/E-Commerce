//
//  AppCoordinator.swift
//  WriteX
//
//  Created by Ahmed Fathy on 04/06/2022.
//

import Foundation
import UIKit



class AppCoordinator: BaseCoordinatorImplementation {

    private var window: UIWindow!
    
    
    init(window: UIWindow) {
        self.window = window
    }
    
    
    override func startCoordinator() {
        window.rootViewController = self.navigationController
        let loginCoordinator = LoginCoordinator(rootNavigation: navigationController)
        self.childCoordinators.append(loginCoordinator)
        loginCoordinator.startCoordinator()
        window.makeKeyAndVisible()
    }
    
    
}


