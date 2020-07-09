//
//  HomePresenter.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 08/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

protocol HomePresenterOutput: class {
    func showMovieList(viewModel: HomeModel.ViewModel)
}

class HomePresenter: HomeInteractorOutput {
    
    weak var output: HomePresenterOutput?
    
    func onSuccessPopularMovie(response: HomeModel.Response.Popular) {
        
        var viewModel: [HomeModel.HomeData] = []
        
        if let data = response.popular?.results {
            data.forEach { (movie) in
                let newViewModel = HomeModel.HomeData(adult: movie.adult,
                                                      id: movie.id,
                                                      posterPath: movie.posterPath,
                                                      video: movie.video,
                                                      originalLanguage: movie.originalLanguage,
                                                      voteCount: movie.voteCount,
                                                      originalTitle: movie.originalTitle,
                                                      backdropPath: movie.backdropPath,
                                                      title: movie.title,
                                                      voteAverage: movie.voteAverage,
                                                      popularity: movie.popularity,
                                                      overview: movie.overview,
                                                      releaseDate: movie.releaseDate,
                                                      genreIds: movie.genreIds)
                viewModel.append(newViewModel)
            }
            
            self.output?.showMovieList(viewModel: HomeModel.ViewModel(homeData: viewModel))
        }
    }
    
    func onSuccessUpcomingMovie(response: HomeModel.Response.Upcoming) {
        var viewModel: [HomeModel.HomeData] = []
        
        if let data = response.upcoming?.results {
            data.forEach { (movie) in
                let newViewModel = HomeModel.HomeData(adult: movie.adult,
                                                      id: movie.id,
                                                      posterPath: movie.posterPath,
                                                      video: movie.video,
                                                      originalLanguage: movie.originalLanguage,
                                                      voteCount: movie.voteCount,
                                                      originalTitle: movie.originalTitle,
                                                      backdropPath: movie.backdropPath,
                                                      title: movie.title,
                                                      voteAverage: movie.voteAverage,
                                                      popularity: movie.popularity,
                                                      overview: movie.overview,
                                                      releaseDate: movie.releaseDate,
                                                      genreIds: movie.genreIds)
                viewModel.append(newViewModel)
            }
            
            self.output?.showMovieList(viewModel: HomeModel.ViewModel(homeData: viewModel))
        }
    }
    
    func onSuccessTopRateMovie(response: HomeModel.Response.TopRated) {
        var viewModel: [HomeModel.HomeData] = []
        
        if let data = response.topRated?.results {
            data.forEach { (movie) in
                let newViewModel = HomeModel.HomeData(adult: movie.adult,
                                                      id: movie.id,
                                                      posterPath: movie.posterPath,
                                                      video: movie.video,
                                                      originalLanguage: movie.originalLanguage,
                                                      voteCount: movie.voteCount,
                                                      originalTitle: movie.originalTitle,
                                                      backdropPath: movie.backdropPath,
                                                      title: movie.title,
                                                      voteAverage: movie.voteAverage,
                                                      popularity: movie.popularity,
                                                      overview: movie.overview,
                                                      releaseDate: movie.releaseDate,
                                                      genreIds: movie.genreIds)
                viewModel.append(newViewModel)
            }
            
            self.output?.showMovieList(viewModel: HomeModel.ViewModel(homeData: viewModel))
        }
    }
    
    func onSuccessNowPlayingMovie(response: HomeModel.Response.NowPlaying) {
        var viewModel: [HomeModel.HomeData] = []
        
        if let data = response.nowPlaying?.results {
            data.forEach { (movie) in
                let newViewModel = HomeModel.HomeData(adult: movie.adult,
                                                      id: movie.id,
                                                      posterPath: movie.posterPath,
                                                      video: movie.video,
                                                      originalLanguage: movie.originalLanguage,
                                                      voteCount: movie.voteCount,
                                                      originalTitle: movie.originalTitle,
                                                      backdropPath: movie.backdropPath,
                                                      title: movie.title,
                                                      voteAverage: movie.voteAverage,
                                                      popularity: movie.popularity,
                                                      overview: movie.overview,
                                                      releaseDate: movie.releaseDate,
                                                      genreIds: movie.genreIds)
                viewModel.append(newViewModel)
            }
            
            self.output?.showMovieList(viewModel: HomeModel.ViewModel(homeData: viewModel))
        }
    }
}
