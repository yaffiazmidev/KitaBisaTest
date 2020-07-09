//
//  DetailConfigurator.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

class DetailConfigurator {
    
    static func configure(viewController: DetailViewController) {
        
        let worker: DetailWorker = DetailWorker()
        let presenter: DetailPresenter = DetailPresenter()
        presenter.output = viewController
        
        let router: DetailRouter = DetailRouter()
        router.parentController = viewController
        
        let interactor: DetailInteractor = DetailInteractor()
        interactor.output = presenter
        interactor.worker = worker
        
        viewController.interactor = interactor
        viewController.router = router
        
    }
}
