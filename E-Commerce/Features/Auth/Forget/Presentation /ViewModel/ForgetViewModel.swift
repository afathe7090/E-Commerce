//
//  ForgetViewModel.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import Foundation
import RxCocoa
import RxSwift

class ForgetViewModel{
    
    
    //MARK: - Behavior
    
    let emailBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    //MARK: - PRoberties
    weak var coordinator: ForgetCoordinator?
    private var useCase: ForgetUseCase?
    
    
    //MARK: - INit
    init(useCase: ForgetUseCase = ForgetUseCase()) {
        self.useCase = useCase
    }
    
    
    //MARK: - Helper Functions
    
    func popToLoginPage(){
        self.coordinator?.didFinishView()
    }
}
