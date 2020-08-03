//
//  MyEvent.swift
//  Swiftevent
//
//  Created by 滝浪翔太 on 2020/07/29.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import Foundation

struct myEvent: Decodable,Identifiable {
    var id: Int
    var title: String
    var date: String
    var place: String!
    var people: Int
    var limit: Int!
    var url: String
    var lat: String!
    var lon: String!
    
    enum CodingKeys: String, CodingKey {
        case id = "event_id"
        case title = "title"
        case date = "started_at"
        case place = "place"
        case people = "accepted"
        case limit = "limit"
        case url = "event_url"
        case lat = "lat"
        case lon = "lon"
    }
}
