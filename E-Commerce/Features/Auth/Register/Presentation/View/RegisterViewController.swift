//
//  LoginViewController.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class RegisterViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var haveAcccountButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: - Proberties
    
    private let bag = DisposeBag()
    private let viewModel: RegisterVIewModel!
    
    
    //MARK: -  Init
    init(viewModel: RegisterVIewModel = RegisterVIewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "RegisterViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewWithShadow()
        runTasks()
       
        
    }

    
    //MARK: - Helper Functions
    
   
    fileprivate func configureViewWithShadow(){
        let views = [emailTextField, passwordTextField, signUpButton, nameTextField]
        views.forEach { view in
            view?.setDefaultShadow()
            view?.setCornerRadius(r: 5)
        }
    }
    
    
    fileprivate func runTasks(){
        Task {
            await [bindingToViewModel() ,signUpButtonActionSubscriber()
                   ,backToSignInActionSubscriber()]
        }
        
    }
    
    
    fileprivate func bindingToViewModel() async {
        nameTextField.rx.text.orEmpty.bind(to: viewModel.nameBehavior).disposed(by: bag)
        emailTextField.rx.text.orEmpty.bind(to: viewModel.emailBehavior).disposed(by: bag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.passwordBehavior).disposed(by: bag)
    }
    
    
    fileprivate func signUpButtonActionSubscriber() async {
        signUpButton.rx.tap.asObservable()
            .subscribe(on: MainScheduler.instance).subscribe(onNext: {[weak self] _ in
                guard let self = self else{ return }
                self.viewModel.signUp()
        }).disposed(by: bag)
    }
    
    
    fileprivate func backToSignInActionSubscriber() async {
        Observable.merge([haveAcccountButton.rx.tap.asObservable() , backButton.rx.tap.asObservable()])
            .subscribe(on: MainScheduler.instance).subscribe(onNext: {[weak self] _ in
                guard let self = self else { return }
                self.viewModel.didFinishView()
        }).disposed(by: bag)
        
    }
    

}
