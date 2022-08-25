//
//  BaseTabBarCoontroller.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 25/08/2022.
//

import Foundation
import UIKit

class BaseTabBarCoordinator: BaseCoordinatorImplementation{
    
    
    private var isRoot = false
    
    
    init(navigationController : UINavigationController, isRoot: Bool = false) {
        super.init()
        self.isRoot = isRoot
        self.navigationController = navigationController
    }
    
    
    override func startCoordinator() {
        
        let rootNavigationAsNew = UINavigationController()
        let tabBar = BaseTabBarController()
        
        let rootNavigation = isRoot ? self.navigationController : rootNavigationAsNew
        let homeCoordinator = HomeCoordinator(rootNavigation:  rootNavigation)
        
        tabBar.viewControllers = [homeCoordinator.startCoordinatorWithNavigationController()]
        
        if isRoot {
            self.navigationController.setViewControllers([tabBar], animated: true)
        }else{
            
            rootNavigationAsNew.setViewControllers([tabBar], animated: true)
            rootNavigationAsNew.modalPresentationStyle = .fullScreen
            self.navigationController.present(rootNavigationAsNew, animated: true, completion: nil)
        }
        
    }
    
    
    
    
    
    
    
    
}
