//
//  DetailWorker.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import Foundation

protocol DetailWorkerDelegate: class {
	func getMovieDetail(request: DetailModel.Request, complition: @escaping (Result<DetailMovieEntity, NetworkError>) -> Void)
}

class DetailWorker: DetailWorkerDelegate {
    var api: Network { return Network() }
    
    func getMovieDetail(request: DetailModel.Request, complition: @escaping (Result<DetailMovieEntity, NetworkError>) -> Void) {
        api.requestDecodeble(endpoint: GeneralEndpoint.getMovieDetail(model: request), completion: complition)
    }
}
