//
//  DetailPresenter.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol DetailPresenterOutput: class {
    func showDetailMovieData(viewModel: DetailModel.ViewModel)
}

class DetailPresenter: DetailInteractorOutput {
	
    weak var output: DetailPresenterOutput?
    
    func onSuccessMovieDetail(response: DetailModel.Response) {
        if let data = response.detailMovie {
            let newViewModel = DetailModel.ViewModel(id: data.id, title: data.title, overview: data.overview, posterPath: data.posterPath, releaseDate: data.releaseDate)
            
            self.output?.showDetailMovieData(viewModel: newViewModel)
        }
    }
}
