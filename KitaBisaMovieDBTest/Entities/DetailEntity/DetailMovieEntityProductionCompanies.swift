//
//  DetailMovieEntityProductionCompanies.swift
//
//  Created by Yaffi Azmi on 09/07/20
//  Copyright (c) KitaBisa. All rights reserved.
//

import Foundation

struct DetailMovieEntityProductionCompanies: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case id
    case originCountry = "origin_country"
    case logoPath = "logo_path"
  }

  var name: String?
  var id: Int?
  var originCountry: String?
  var logoPath: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    id = try container.decodeIfPresent(Int.self, forKey: .id)
    originCountry = try container.decodeIfPresent(String.self, forKey: .originCountry)
    logoPath = try container.decodeIfPresent(String.self, forKey: .logoPath)
  }

}
