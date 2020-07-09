//
//  HomeRouter.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol HomeRouterProtocol: class {
    // do something
}

class HomeRouter: HomeRouterProtocol {
    
    weak var parentController: HomeViewController?
    private var navigationController: UINavigationController? { parentController?.navigationController }
    
}
