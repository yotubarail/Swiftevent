//
//  MyRowView.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import SwiftUI

import Foundation

struct MyRowView: View {
    
    var eventData: myEvent

    var body: some View {
        
        HStack {
            VStack(alignment: .leading) {
                Text(eventData.title)
                    .font(.system(size: 20))
                    .foregroundColor(Color.black)
                    .padding(.bottom,20)
                HStack {
                    Image(systemName: "mappin.and.ellipse")
                        .foregroundColor(Color.red)
                    Text(eventData.place ?? "未定")
                    .font(.system(size: 15))
                    .foregroundColor(Color.black)
                }
            }
            Spacer()
            Text(myEventDateFormatter.StringToDate(dateString: eventData.date, isOnlyDate: false))
                .foregroundColor(Color.black)
        }
        .padding(.horizontal, 10)
        .background(myRowBackgroundView())
        .padding(.vertical, 10)
        .compositingGroup()
        .shadow(radius: 5)
        .background(myListBackgroundView())
    }
}

final class myEventDateFormatter: DateFormatter {
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


struct MyRowView_Previews: PreviewProvider {
    static var previews: some View {
        MyRowView(eventData: mockMyEventsData[0])
    }
}
