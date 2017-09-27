//
//  MainViewController.swift
//  Routing
//
//  Created by Nikita Ermolenko on 27/09/2017.
//  Copyright © 2017 Rosberry. All rights reserved.
//

import UIKit

final class MainViewController: UIViewController {
    
    let viewModel: MainViewModel
    
    private lazy var settingsButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(settingsButtonPressed), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    init(viewModel: MainViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.didTriggerViewReadyEvent()
    }
    
    // MARK: - Actions
    
    @objc private func settingsButtonPressed(_ sender: UIButton) {
        viewModel.didTriggerSettingsEvent()
    }
}
