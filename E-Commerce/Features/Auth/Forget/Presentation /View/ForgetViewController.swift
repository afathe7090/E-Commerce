//
//  ForgetViewController.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 07/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class ForgetViewController: UIViewController {

    
    //MARK: - Proberties
    private let viewModel: ForgetViewModel!
    private let bag = DisposeBag()
    
    
    //MARK: - @IBOutlet
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    
    //MARK: - INit
    
    init(viewModel: ForgetViewModel = ForgetViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "ForgetViewController", bundle: nil)
        
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    //MARK: - LifeCycle 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
        runTasks()
    }

    
    //MARK: - Helper Functions
    
    
    func configureViews(){
        let views = [emailTextField, sendButton]
        views.forEach { view in
            view?.setDefaultShadow()
            view?.setCornerRadius(r: 5)
        }
    }
    
    
    //MARK: - Subscribation
    
    fileprivate func runTasks(){
        Task{
            await [ backButtonSubscribe() , sendForgetButtonSubscribe()]
        }
    }
    
    
    fileprivate func backButtonSubscribe() async {
        backButton.rx.tap.subscribe(on: MainScheduler.instance).subscribe(onNext: {[ weak self] _ in
            guard let self = self else { return }
            self.viewModel.popToLoginPage()
        }).disposed(by: bag)
    }
    
    fileprivate func sendForgetButtonSubscribe() async {
        sendButton.rx.tap.subscribe(on: MainScheduler.instance).subscribe(onNext: { _ in
            
        }).disposed(by: bag)
    }

}
