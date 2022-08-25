//
//  LoginVIewModel.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase
import RxCocoa
import RxSwift

class HomeVIewModel {
    
    
    //MARK: - Behavior
    
    
    //MARK: - Proberties
    weak var coordinator: HomeCoordinator?
    private var useCase: HomeUseCase?
    private let bag = DisposeBag()
    
    
    
    //MARK: - INit
    init(useCase: HomeUseCase = HomeUseCase()) {
        self.useCase = useCase
        
    }
    

    
    
}
