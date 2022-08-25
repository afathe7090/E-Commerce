//
//  LoginVIewModel.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase
import RxCocoa
import RxSwift

class LoginVIewModel {
    
    
    
    //MARK: - Behavior
    let emailBehaviour: BehaviorRelay<String> = BehaviorRelay(value: "")
    let passwordBehaviour: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    
    //MARK: - Proberties
    weak var coordinator: LoginCoordinator?
    private var useCase: LoginUseCase?
    private let bag = DisposeBag()
    
    
    
    //MARK: - INit
    init(useCase: LoginUseCase = LoginUseCase()) {
        self.useCase = useCase
        
    }
    
    //MARK: - Helper Functions
    func pushToForgetViewController(){
        self.coordinator?.pushToForgetPasswordViewController()
    }
    
    
    func pushTORegisterViewCOntroller(){
        self.coordinator?.pushToRegisterViewCOntroller()
    }
    
    
    //MARK: - Manager Firebase
    
    func signIn() {
        Task{
            do{
                _ = try await useCase?.signIn(email: emailBehaviour.value, password: passwordBehaviour.value)
                DispatchQueue.main.async {
                    self.coordinator?.pushToBaseScenesController()
                }
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
}
