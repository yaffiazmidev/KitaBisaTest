//
//  MovieEntityResults.swift
//
//  Created by Yaffi Azmi on 09/07/20
//  Copyright (c) KitaBisa. All rights reserved.
//

import Foundation

struct MovieEntityResults: Codable {

  enum CodingKeys: String, CodingKey {
    case originalTitle = "original_title"
    case releaseDate = "release_date"
    case title
    case posterPath = "poster_path"
    case voteCount = "vote_count"
    case id
    case video
    case genreIds = "genre_ids"
    case overview
    case originalLanguage = "original_language"
    case adult
    case backdropPath = "backdrop_path"
    case popularity
    case voteAverage = "vote_average"
  }

  var originalTitle: String?
  var releaseDate: String?
  var title: String?
  var posterPath: String?
  var voteCount: Int?
  var id: Int?
  var video: Bool?
  var genreIds: [Int]?
  var overview: String?
  var originalLanguage: String?
  var adult: Bool?
  var backdropPath: String?
  var popularity: Float?
  var voteAverage: Float?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    genreIds = try container.decodeIfPresent([Int].self, forKey: .genreIds)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    voteAverage = try container.decodeIfPresent(Float.self, forKey: .voteAverage)
  }

}
