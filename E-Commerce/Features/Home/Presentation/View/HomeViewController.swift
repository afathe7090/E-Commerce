//
//  LoginViewController.swift
//  E-Commerce
//
//  Created by Ahmed Fathy on 06/08/2022.
//

import UIKit
import RxSwift
import RxCocoa

class HomeViewController: UIViewController {

    //MARK: - IBOutlet
  
    //MARK: - Proberties
    
    private let bag = DisposeBag()
    private let viewModel: HomeVIewModel!
    
    
    //MARK: -  Init
    init(viewModel: HomeVIewModel = HomeVIewModel()) {
        self.viewModel = viewModel
        super.init(nibName: "HomeViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    //MARK: - Lyfe Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    

}
