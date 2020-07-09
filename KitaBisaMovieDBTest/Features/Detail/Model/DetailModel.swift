//
//  DetailModel.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

struct DetailModel {	
	struct Request {
        var movieId: Int

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
        var detailMovie: DetailMovieEntity?
	}

	struct ViewModel {
        var id: Int?
        var title: String?
        var overview: String?
        var posterPath: String?
        var releaseDate: String?
	}
}

struct FavoriteLocalModel: Codable {
    var id: Int?
    var title: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
}
