//
//  HomeConfigurator.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

class HomeConfigurator {
    
    static func configure(viewController: HomeViewController) {
        
        let worker: HomeWorker = HomeWorker()
        let presenter: HomePresenter = HomePresenter()
        presenter.output = viewController
        
        let router: HomeRouter = HomeRouter()
        router.parentController = viewController
        
        let interactor: HomeInteractor = HomeInteractor()
        interactor.output = presenter
        interactor.worker = worker
        
        viewController.interactor = interactor
        viewController.router = router
        
    }
}
