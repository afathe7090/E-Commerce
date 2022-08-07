//
//  Coordinator.swift
//  WriteX
//
//  Created by Ahmed Fathy on 05/06/2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    
    var childCoordinators: [Coordinator] { get }
    var navigationController: UINavigationController { get }
    func startCoordinator()
    func startCoordinatorWithNavigationController()-> UINavigationController
    func startCoordinatorWithViewCOntroller()-> UIViewController
}

open class BaseCoordinatorImplementation: Coordinator {
    var childCoordinators: [Coordinator] = []
    var navigationController: UINavigationController = UINavigationController()
    
    func startCoordinator() {}
    
    
    func startCoordinatorWithNavigationController()-> UINavigationController { UINavigationController() }
    func startCoordinatorWithViewCOntroller()-> UIViewController { UIViewController() }
    
    func didChildCoordinator(_ coordinator: Coordinator, completion: @escaping (_ viewCoordinate: UINavigationController)-> Void?) {
        if let coordinator = childCoordinators.firstIndex(where: { coordinator in
            coordinator === coordinator
        }){
            childCoordinators.remove(at: coordinator)
            completion(self.navigationController)
        }
    }
    
}
