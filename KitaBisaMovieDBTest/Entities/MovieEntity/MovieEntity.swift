//
//  MovieEntity.swift
//
//  Created by Yaffi Azmi on 09/07/20
//  Copyright (c) KitaBisa. All rights reserved.
//

import Foundation

struct MovieEntity: Codable {

  enum CodingKeys: String, CodingKey {
    case results
    case totalResults = "total_results"
    case page
    case totalPages = "total_pages"
  }

  var results: [MovieEntityResults]?
  var totalResults: Int?
  var page: Int?
  var totalPages: Int?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    results = try container.decodeIfPresent([MovieEntityResults].self, forKey: .results)
    totalResults = try container.decodeIfPresent(Int.self, forKey: .totalResults)
    page = try container.decodeIfPresent(Int.self, forKey: .page)
    totalPages = try container.decodeIfPresent(Int.self, forKey: .totalPages)
  }

}
