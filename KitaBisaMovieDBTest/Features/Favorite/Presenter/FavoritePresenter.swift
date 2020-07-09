

//
//  FavoritePresenter.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol FavoritePresenterOutput: class {
	// do someting...
}

class FavoritePresenter: FavoriteInteractorOutput {
	
    weak var output: FavoritePresenterOutput?
}
