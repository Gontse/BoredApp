//
//  ActivityViewController.swift
//  BoredApp
//
//  Created by Gontse Ranoto (ZA) on 2023/01/29.
//

import UIKit
import Combine

final class ActivityViewController: UIViewController {
    
    private var viewModel: ActivityViewModel
    
    init(factory: ActivityFactory) {
        viewModel = factory.makeActivityViewModel()
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*,unavailable, message: "Loading this view controller from a nib is unsupported in favor of initializer dependency injection.")
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.fetchActivity()
    }
    
    private func viewModelBinding() {
        
    }
}

// MARK: - ActivityViewControllerFactory

protocol ActivityViewControllerFactory {
    
    func makeActivityViewController() -> ActivityViewController
}

