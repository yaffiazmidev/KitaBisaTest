//
//  DetailMovieEntity.swift
//
//  Created by Yaffi Azmi on 09/07/20
//  Copyright (c) KitaBisa. All rights reserved.
//

import Foundation

struct DetailMovieEntity: Codable {

  enum CodingKeys: String, CodingKey {
    case tagline
    case productionCountries = "production_countries"
    case spokenLanguages = "spoken_languages"
    case originalLanguage = "original_language"
    case genres
    case productionCompanies = "production_companies"
    case originalTitle = "original_title"
    case homepage
    case runtime
    case releaseDate = "release_date"
    case voteAverage = "vote_average"
    case revenue
    case voteCount = "vote_count"
    case id
    case overview
    case backdropPath = "backdrop_path"
    case adult
    case budget
    case imdbId = "imdb_id"
    case posterPath = "poster_path"
    case title
    case video
    case popularity
    case status
  }

  var tagline: String?
  var productionCountries: [DetailMovieEntityProductionCountries]?
  var spokenLanguages: [DetailMovieEntitySpokenLanguages]?
  var originalLanguage: String?
  var genres: [DetailMovieEntityGenres]?
  var productionCompanies: [DetailMovieEntityProductionCompanies]?
  var originalTitle: String?
  var homepage: String?
  var runtime: Int?
  var releaseDate: String?
  var voteAverage: Double?
  var revenue: Int?
  var voteCount: Int?
  var id: Int?
  var overview: String?
  var backdropPath: String?
  var adult: Bool?
  var budget: Int?
  var imdbId: String?
  var posterPath: String?
  var title: String?
  var video: Bool?
  var popularity: Float?
  var status: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    tagline = try container.decodeIfPresent(String.self, forKey: .tagline)
    productionCountries = try container.decodeIfPresent([DetailMovieEntityProductionCountries].self, forKey: .productionCountries)
    spokenLanguages = try container.decodeIfPresent([DetailMovieEntitySpokenLanguages].self, forKey: .spokenLanguages)
    originalLanguage = try container.decodeIfPresent(String.self, forKey: .originalLanguage)
    genres = try container.decodeIfPresent([DetailMovieEntityGenres].self, forKey: .genres)
    productionCompanies = try container.decodeIfPresent([DetailMovieEntityProductionCompanies].self, forKey: .productionCompanies)
    originalTitle = try container.decodeIfPresent(String.self, forKey: .originalTitle)
    homepage = try container.decodeIfPresent(String.self, forKey: .homepage)
    runtime = try container.decodeIfPresent(Int.self, forKey: .runtime)
    releaseDate = try container.decodeIfPresent(String.self, forKey: .releaseDate)
    voteAverage = try container.decodeIfPresent(Double.self, forKey: .voteAverage)
    revenue = try container.decodeIfPresent(Int.self, forKey: .revenue)
    voteCount = try container.decodeIfPresent(Int.self, forKey: .voteCount)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    overview = try container.decodeIfPresent(String.self, forKey: .overview)
    backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath)
    adult = try container.decodeIfPresent(Bool.self, forKey: .adult)
    budget = try container.decodeIfPresent(Int.self, forKey: .budget)
    imdbId = try container.decodeIfPresent(String.self, forKey: .imdbId)
    posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath)
    title = try container.decodeIfPresent(String.self, forKey: .title)
    video = try container.decodeIfPresent(Bool.self, forKey: .video)
    popularity = try container.decodeIfPresent(Float.self, forKey: .popularity)
    status = try container.decodeIfPresent(String.self, forKey: .status)
  }

}
