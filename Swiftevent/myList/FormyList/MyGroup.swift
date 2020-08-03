//
//  MyGroup.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

struct myGroup: Decodable {
    var events: [myEvent]
}

let mockMyEventsData: [myEvent]
= [myEvent(id: 1,
         title: "Swiftに触ろう",
         date: "6/24\n19:00",
         place: "東京都足立区",
         people: 15,
         limit: 100,
         url: "https://st2121.web.fc2.com",
         lat: "0",
         lon: "0"),
   myEvent(id: 2,
         title: "Swiftおべんつよかい",
         date: "6/24\n19:00",
         place: "静岡県静岡市清水区",
         people: 35,
         limit: 50,
         url: "",
         lat: "0",
         lon: "0")
]
