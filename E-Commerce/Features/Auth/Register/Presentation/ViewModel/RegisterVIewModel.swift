//
//  LoginVIewModel.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Foundation
import RxCocoa
import RxSwift

class RegisterVIewModel {
    
    let nameBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    let emailBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    let passwordBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    
    weak var coordinator: RegisterCoordinator?
    
    private var useCase: RegisterUseCase?
    private let bag = DisposeBag()
    
    init(useCase: RegisterUseCase = RegisterUseCase()) {
        self.useCase = useCase
    }
    
    func TestPrint(){
        useCase?.TestPrint()
    }
    
    func didFinishView(){
        coordinator?.didFinishView()
    }
    
}
