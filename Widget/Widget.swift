//
//  Widget.swift
//  Widget
//
//  Created by 滝浪翔太 on 2020/11/18.
//  Copyright © 2020 滝浪翔太. All rights reserved.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: TimelineProvider {
    
    func getSnapshot(in context: Context, completion: @escaping (SwifteventEntry) -> Void) {
        
        let entry = SwifteventEntry(date: Date(), eventName: "イベント名", eventPlace: "場所")
        completion(entry)
    }
    
    func placeholder(in context: Context) -> SwifteventEntry {
        
        SwifteventEntry(date: Date(), eventName: "イベント名", eventPlace: "場所")
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<SwifteventEntry>) -> Void) {
        
        let entry = SwifteventEntry(date: Date(), eventName: "もくもく会", eventPlace: "オンライン")
        let timeline = Timeline(entries: [entry], policy: .atEnd)
        completion(timeline)
    }
}

struct SwifteventEntry: TimelineEntry {
    
    let date: Date
    let eventName: String
    let eventPlace: String
}

struct SwifteventWidgetView: View {
    
    var entry: SwifteventEntry
    var body: some View {
        VStack {
            Text("次のイベントは...")
            HStack {
                VStack {
                    Text(entry.eventName)
                        .padding(10)
                    Text(entry.eventPlace)
                        .padding(10)
                }
                Text("\(entry.date, style: .time)")
            }
        }
    }
}

@main
struct SwifteventWidget: Widget {
    let kind: String = "SwifteventWidget"

    var body: some WidgetConfiguration {
        StaticConfiguration(kind: kind, provider: Provider()) { entry in
            SwifteventWidgetView(entry: entry)
        }
        .configurationDisplayName("My Widget")
        .description("This is an example widget.")
    }
}
