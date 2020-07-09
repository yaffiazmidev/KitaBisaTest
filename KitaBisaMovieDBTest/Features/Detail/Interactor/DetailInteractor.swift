//
//  DetailInteractor.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol DetailInteractorInput: class {
    func handleMovieDetail(request: DetailModel.Request)
}

protocol DetailInteractorOutput: class {
    func onSuccessMovieDetail(response: DetailModel.Response)
}

class DetailInteractor: DetailInteractorInput {
    
    var output: DetailInteractorOutput?
    var worker: DetailWorkerDelegate?
    
    func handleMovieDetail(request: DetailModel.Request) {
        worker?.getMovieDetail(request: request, complition: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let response = DetailModel.Response(detailMovie: data)
                self.output?.onSuccessMovieDetail(response: response)
            }
        })
    }
    
}
