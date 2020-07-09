
//
//  FavoriteConfigurator.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

class FavoriteConfigurator {
    
    static func configure(viewController: FavoriteViewController) {
        
        let worker: FavoriteWorker = FavoriteWorker()
        let presenter: FavoritePresenter = FavoritePresenter()
        presenter.output = viewController
        
        let router: FavoriteRouter = FavoriteRouter()
        router.parentController = viewController
        
        let interactor: FavoriteInteractor = FavoriteInteractor()
        interactor.output = presenter
        interactor.worker = worker
        
        viewController.interactor = interactor
        viewController.router = router
        
    }
}
