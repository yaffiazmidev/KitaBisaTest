//
//  ApiClient.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation
import Alamofire

enum GeneralEndpoint {
    case getPopularMovieList(model: HomeModel.Request.Popular)
    case getUpcomingMovieList(model: HomeModel.Request.Upcoming)
    case getTopRatedMovieList(model: HomeModel.Request.TopRated)
    case getNowPlayingMovieList(model: HomeModel.Request.NowPlaying)
    case getMovieDetail(model: DetailModel.Request)
    
}

extension GeneralEndpoint: IEndpoint {
    var method: HTTPMethod {
        switch self {
        case .getPopularMovieList,
             .getUpcomingMovieList,
             .getTopRatedMovieList,
             .getNowPlayingMovieList,
             .getMovieDetail:
            return .get
        }
    }

    var path: String {
        switch self {
        case .getPopularMovieList:
            return ApiConstants.BaseURLV3 + ApiConstants.Movie.popular + ApiConstants.apiKey
        case .getUpcomingMovieList:
            return ApiConstants.BaseURLV3 + ApiConstants.Movie.upcoming + ApiConstants.apiKey
        case .getTopRatedMovieList:
            return ApiConstants.BaseURLV3 + ApiConstants.Movie.topRated + ApiConstants.apiKey
        case .getNowPlayingMovieList:
            return ApiConstants.BaseURLV3 + ApiConstants.Movie.nowPlaying + ApiConstants.apiKey
        case .getMovieDetail(let model):
            return ApiConstants.BaseURLV3 + ApiConstants.Movie.detail + "\(model.movieId)" + ApiConstants.apiKey
        }
    }

    var parameter: Parameters? {
        switch self {
        case .getPopularMovieList(let model):
            return model.parameters
        case .getUpcomingMovieList(let model):
            return model.parameters
        case .getTopRatedMovieList(let model):
            return model.parameters
        case .getNowPlayingMovieList(let model):
            return model.parameters
        case .getMovieDetail:
            return nil
        }
    }
    
    var header: HTTPHeaders? {
        var params: HTTPHeaders = [:]
        params["Content-Type"] = "application/json"
        switch self {
        case .getPopularMovieList,
             .getUpcomingMovieList,
             .getTopRatedMovieList,
             .getNowPlayingMovieList,
             .getMovieDetail:
            return params
        }
    }


    var encoding: ParameterEncoding {
        switch self {
        case .getPopularMovieList,
             .getUpcomingMovieList,
             .getTopRatedMovieList,
             .getNowPlayingMovieList,
             .getMovieDetail:
            return URLEncoding.queryString
        }
    }
}
