//
//  HomeWorker.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import Foundation

protocol HomeWorkerDelegate: class {
    func getPopularList(request: HomeModel.Request.Popular, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void)
    func getUpcomingList(request: HomeModel.Request.Upcoming, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void)
    func getTopRateList(request: HomeModel.Request.TopRated, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void)
    func getNowPlayingList(request: HomeModel.Request.NowPlaying, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void)
}

class HomeWorker: HomeWorkerDelegate {
    var api: Network { return Network() }
    
    func getPopularList(request: HomeModel.Request.Popular, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void) {
        api.requestDecodeble(endpoint: GeneralEndpoint.getPopularMovieList(model: request), completion: complition)
    }
    
    func getUpcomingList(request: HomeModel.Request.Upcoming, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void) {
        api.requestDecodeble(endpoint: GeneralEndpoint.getUpcomingMovieList(model: request), completion: complition)
    }
    
    func getTopRateList(request: HomeModel.Request.TopRated, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void) {
        api.requestDecodeble(endpoint: GeneralEndpoint.getTopRatedMovieList(model: request), completion: complition)
    }
    
    func getNowPlayingList(request: HomeModel.Request.NowPlaying, complition: @escaping (Result<MovieEntity, NetworkError>) -> Void) {
        api.requestDecodeble(endpoint: GeneralEndpoint.getNowPlayingMovieList(model: request), completion: complition)
    }
}
