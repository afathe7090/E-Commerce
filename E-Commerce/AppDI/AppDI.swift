//
//  AppDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import Swinject



extension Container  {
    
    func applicationDependencyAllFeatures(){
        
        
        //MARK: - Coordinator
        
        coordinatorDependencyContainerization()
        
        
        //MARK: - Network Manager
        
        firebaseAuthenticationDependencyInjection()
        
        
        //MARK: - Screens Container
        
        loginDependencyContainerization()
                
        registerDependencyContainerization()
        
        forgetDependencyContainerization()
        
        homeDependencyContainerization()

    }
    
    
}


