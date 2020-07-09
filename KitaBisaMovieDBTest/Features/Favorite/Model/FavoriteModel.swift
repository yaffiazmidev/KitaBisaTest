//
//  FavoriteModel.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright (c) 2020 Yaffi Azmi. All rights reserved.
//  Modify By:  * Yaffi Azmi
//              * yaffiazmi.dev@gmail.com
//              * https://github.com/yaffiazmidev
//

import UIKit

struct FavoriteModel {	
	struct Request {
		// do someting...

		var parameters: [String: Any]? {
			// do someting...
			return nil
		}
	}

	struct Response {
		// do someting...
	}

    struct ViewModel: Hashable {
		var id: Int?
        var title: String?
        var overview: String?
        var posterPath: String?
        var releaseDate: String?
	}
}
