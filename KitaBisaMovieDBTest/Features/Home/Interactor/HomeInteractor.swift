//
//  HomeInteractor.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol HomeInteractorInput: class {
    func handlePopularMovie(request: HomeModel.Request.Popular)
    func handleUpcomingMovie(request: HomeModel.Request.Upcoming)
    func handleTopRateMovie(request: HomeModel.Request.TopRated)
    func handleNowPlayingMovie(request: HomeModel.Request.NowPlaying)
}

protocol HomeInteractorOutput: class {
    func onSuccessPopularMovie(response: HomeModel.Response.Popular)
    func onSuccessUpcomingMovie(response: HomeModel.Response.Upcoming)
    func onSuccessTopRateMovie(response: HomeModel.Response.TopRated)
    func onSuccessNowPlayingMovie(response: HomeModel.Response.NowPlaying)
}

class HomeInteractor: HomeInteractorInput {
    
    var output: HomeInteractorOutput?
    var worker: HomeWorkerDelegate?
    
    func handlePopularMovie(request: HomeModel.Request.Popular) {
        worker?.getPopularList(request: request, complition: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let response = HomeModel.Response.Popular(popular: data)
                self.output?.onSuccessPopularMovie(response: response)
            }
        })
    }
    
    func handleUpcomingMovie(request: HomeModel.Request.Upcoming) {
        worker?.getUpcomingList(request: request, complition: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let response = HomeModel.Response.Upcoming(upcoming: data)
                self.output?.onSuccessUpcomingMovie(response: response)
            }
        })
    }
    
    func handleTopRateMovie(request: HomeModel.Request.TopRated) {
        worker?.getTopRateList(request: request, complition: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let response = HomeModel.Response.TopRated(topRated: data)
                self.output?.onSuccessTopRateMovie(response: response)
            }
        })
    }
    
    func handleNowPlayingMovie(request: HomeModel.Request.NowPlaying) {
        worker?.getNowPlayingList(request: request, complition: { (result) in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let data):
                let response = HomeModel.Response.NowPlaying(nowPlaying: data)
                self.output?.onSuccessNowPlayingMovie(response: response)
            }
        })
    }
    
}
