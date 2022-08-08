//
//  LoginVIewModel.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import Firebase
import RxCocoa
import RxSwift

class RegisterVIewModel {
    
    //MARK: - Behaviors
    
    let nameBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    let emailBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    let passwordBehavior: BehaviorRelay<String> = BehaviorRelay(value: "")
    
    
    //MARK: - Proberties
    weak var coordinator: RegisterCoordinator?
    private var useCase: RegisterUseCase?
    private let bag = DisposeBag()
    
    
    
    //MARK: -  Init
    init(useCase: RegisterUseCase = RegisterUseCase()) {
        self.useCase = useCase
    }
    
    //MARK: - Helper Function
    
    func didFinishView(){
        coordinator?.didFinishView()
    }
    
    
    //MARK: - FirebaseManager Sign Up
    
    func signUp(){
        //Note : We Will add user name and id to realtime/firestore firebase
        Task{
            do{
                guard let useCase = useCase else { return }
                let result = try await useCase.signUp(email: emailBehavior.value, password: passwordBehavior.value)
                result.user.sendEmailVerification(completion: nil)
            }catch{
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    
}
