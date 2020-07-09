//
//  DetailRouter.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol DetailRouterProtocol: class {
    // do something
}

class DetailRouter: DetailRouterProtocol {
    
    weak var parentController: DetailViewController?
    private var navigationController: UINavigationController? { parentController?.navigationController }
    
}
