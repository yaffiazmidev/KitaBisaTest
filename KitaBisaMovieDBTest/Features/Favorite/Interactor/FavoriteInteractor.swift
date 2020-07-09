//
//  FavoriteInteractor.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol FavoriteInteractorInput: class {
}

protocol FavoriteInteractorOutput: class {
}

class FavoriteInteractor: FavoriteInteractorInput {
    
    var output: FavoriteInteractorOutput?
    var worker: FavoriteWorkerDelegate?
    
}
