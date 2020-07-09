//
//  HomeModel.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

struct HomeModel {	
	struct Request {
        struct Popular {
            var page: Int
            var parameters: [String: Any]? {
                var param: [String: Any] = [:]
                param["page"] = self.page
                return param
            }
        }
        
        struct Upcoming {
            var page: Int
            var parameters: [String: Any]? {
                // do someting...
                return nil
            }
        }
        
        struct TopRated {
            var page: Int
            var parameters: [String: Any]? {
                // do someting...
                return nil
            }
        }
        
        struct NowPlaying {
            var page: Int
            var parameters: [String: Any]? {
                // do someting...
                return nil
            }
        }
	}

	struct Response {
        struct Popular {
            var popular: MovieEntity?
        }
        
        struct Upcoming {
            var upcoming: MovieEntity?
        }
        
        struct TopRated {
            var topRated: MovieEntity?
        }
        
        struct NowPlaying {
            var nowPlaying: MovieEntity?
        }
	}

	struct ViewModel {
        var homeData: [HomeData]?
	}
    
    struct HomeData {
        var adult: Bool?
        var id: Int?
        var posterPath: String?
        var video: Bool?
        var originalLanguage: String?
        var voteCount: Int?
        var originalTitle: String?
        var backdropPath: String?
        var title: String?
        var voteAverage: Float?
        var popularity: Float?
        var overview: String?
        var releaseDate: String?
        var genreIds: [Int]?
    }
    
    
}
