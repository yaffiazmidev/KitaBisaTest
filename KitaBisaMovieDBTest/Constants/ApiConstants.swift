//
//  ApiConstants.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import Foundation

struct ApiConstants {
    
    static let BaseURLV3 = "https://api.themoviedb.org/3/"
    static let imageBaseURL = "https://image.tmdb.org/t/p/"
    static let apiKey = "?api_key=8459d55411c6b2f4ca193e33a534f9ad"
    
    struct Movie {
        static let popular = "movie/popular"
        static let upcoming = "movie/upcoming"
        static let topRated = "movie/top_rated"
        static let nowPlaying = "movie/now_playing"
        static let detail = "movie/"
    }
    
    struct Image {
        struct Resolution {
            static let original = "original"
            static let w1280 = "w1280"
            static let w780 = "w780"
            static let w500 = "w500"
            static let w342 = "w342"
            static let w300 = "w300"
        }
    }
}
