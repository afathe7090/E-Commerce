//
//  FirebaseDI.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 08/08/2022.
//

import Foundation
import Swinject


extension Container {
    
    
    func firebaseAuthenticationDependencyInjection(){
        
        register(LoginFirebase.self) { _ in return FirebaseAuthentication.init() }
        
        register(RegisterFirebase.self) { _ in return FirebaseAuthentication.init() }
        
        register(ForgetFirebase.self) { _ in return FirebaseAuthentication.init() }
        
    }
    
    
    
}
