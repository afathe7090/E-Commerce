//
//  CoordinatorDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 25/08/2022.
//

import Foundation
import Swinject


extension Container {
    
    
    func coordinatorDependencyContainerization(){
        
        register(Coordinator.self) { _ in
            return BaseCoordinatorImplementation()
        }
        
        register(BaseCoordinatorImplementation.self) { _ in
            return BaseCoordinatorImplementation()
        }
        
    }
    
    
    
}
