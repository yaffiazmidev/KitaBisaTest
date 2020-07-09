//
//  Extension+String.swift
//  KitaBisaMovieDBTest
//
//  Created by Yaffi Azmi on 09/07/20.
//  Copyright © 2020 Yaffi Azmi. All rights reserved.
//

import UIKit

extension String {
    func converDateStringFormat(from: String, to: String) -> String {
        var newDateStringFormat: String = ""
        
        let dateFormatter = DateFormatter()
        //        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.dateFormat = from
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.timeZone = TimeZone(abbreviation: "GMT")
        dateFormatter.timeZone = TimeZone.current
        
        if let date = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = to
            newDateStringFormat = dateFormatter.string(from: date)
        }
        
        return newDateStringFormat
    }
}

