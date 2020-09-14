//
//  EventDateFormatter.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/09/14.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

final class EventDateFormatter: DateFormatter {
    class func StringToDate(dateString: String, isOnlyDate: Bool) -> String {
        let formatter = ISO8601DateFormatter()
        let date = formatter.date(from: dateString)
        return DateToString(date: date!, isOnlyDate: isOnlyDate)
    }
    
    class func DateToString(date: Date, isOnlyDate: Bool) -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.locale = Locale(identifier: "ja_JP")
        formatter.setLocalizedDateFormatFromTemplate("MdkHm")
        return formatter.string(from: date)
    }
}
