//
//  DetailMovieEntitySpokenLanguages.swift
//
//  Created by Yaffi Azmi on 09/07/20
//  Copyright (c) KitaBisa. All rights reserved.
//

import Foundation

struct DetailMovieEntitySpokenLanguages: Codable {

  enum CodingKeys: String, CodingKey {
    case name
    case iso6391 = "iso_639_1"
  }

  var name: String?
  var iso6391: String?



  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: CodingKeys.self)
    name = try container.decodeIfPresent(String.self, forKey: .name)
    iso6391 = try container.decodeIfPresent(String.self, forKey: .iso6391)
  }

}
