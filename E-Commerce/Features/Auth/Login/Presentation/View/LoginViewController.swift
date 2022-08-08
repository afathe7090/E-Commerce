//
//  LoginViewController.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: UIViewController {

    //MARK: - IBOutlet
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var forgetPasswordButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    //MARK: - Proberties
    
    private let bag = DisposeBag()
    private let viewModel: LoginVIewModel!
    
    
    //MARK: -  Init
    init(viewModel: LoginVIewModel = LoginVIewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "LoginViewController", bundle: nil)
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
        let views = [emailTextField, passwordTextField, loginButton]
        views.forEach { view in
            view?.setDefaultShadow()
            view?.setCornerRadius(r: 5)
        }
    }
    
    
    fileprivate func runTasks(){
        Task {
            await [bindingToViewModel() ,loginButtonActionSubscriber()
                   ,forgetButtonActionSubscriber() ,registerButtonActionSubscriber()]
        }
        
    }
    
    
    fileprivate func bindingToViewModel() async {
        emailTextField.rx.text.orEmpty.bind(to: viewModel.emailBehaviour).disposed(by: bag)
        passwordTextField.rx.text.orEmpty.bind(to: viewModel.passwordBehaviour).disposed(by: bag)
    }
    
    
    fileprivate func loginButtonActionSubscriber() async {
        loginButton.rx.tap.asObservable().subscribe(on: MainScheduler.instance).subscribe(onNext: { _ in
            self.viewModel.signIn()
        }).disposed(by: bag)
    }
    
    
    fileprivate func forgetButtonActionSubscriber() async {
        forgetPasswordButton.rx.tap.asObservable()
            .subscribe(on: MainScheduler.instance).subscribe(onNext: {[weak self] _ in
                guard let self = self else { return }
                self.viewModel.pushToForgetViewController()
        }).disposed(by: bag)
    }
    
    
    fileprivate func registerButtonActionSubscriber() async {
        registerButton.rx.tap.asObservable()
            .subscribe(on: MainScheduler.instance).subscribe(onNext: {[weak self]  _ in
                guard let self = self else { return }
                self.viewModel.pushTORegisterViewCOntroller()
        }).disposed(by: bag)
    }

}
