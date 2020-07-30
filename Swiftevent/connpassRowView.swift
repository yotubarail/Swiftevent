//
//  connpassRowView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI
import Foundation

struct connpassRowView: View {
    
    var eventData: Event

    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(eventData.title)
                    .font(.system(size: 20))
                    .padding(.bottom,20)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color.red)
                    Text(eventData.place ?? "未定")
                    .font(.system(size: 15))
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Spacer()
                Text(EventDateFormatter.StringToDate(dateString: eventData.date, isOnlyDate: false))
                Spacer()
                Text("参加:" + String(eventData.people) + "人")
                Text("定員:" + String((eventData.limit ?? 0)) + "人")
                Spacer()
            }
        }
    }
}

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


struct connpassRowView_Previews: PreviewProvider {
    static var previews: some View {
        connpassRowView(eventData: mockEventsData[0])
    }
}
